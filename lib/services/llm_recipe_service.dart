import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_input.dart';
import '../models/recipe.dart';

class LlmRecipeService {
  static const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');
  static const String _model = 'gemini-3.8-flash';
  static const String _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/interactions';

  final http.Client client = http.Client();
  final UserInput input;

  LlmRecipeService({required this.input});

  Future<List<Recipe>> generateRecipe() async {
    if (_apiKey.isEmpty) {
      throw Exception(
        "No API key. Run with --dart-define-from-file=dart_define.json",
      );
    }

    final body = {
      'model': _model,
      'input': _buildPrompt(input),
      'tools': [
        {'type': 'google_search'},
      ],
      'response_format': {
        'type': 'text',
        'mime_type': 'application/json',
        'schema': _schema,
      },
    };

    late final http.Response response;
    try {
      response = await client
          .post(
            Uri.parse(_endpoint),
            headers: {
              'Content-Type': 'application/json',
              'x-goog-api-key': _apiKey,
            },
            body: jsonEncode(body),
          )
          // Grounded calls are slow. 90s is not paranoid.
          .timeout(const Duration(seconds: 90));
    } catch (e) {
      throw Exception('Network error: $e');
    }

    if (response.statusCode != 200) {
      throw Exception(
        'Gemini returned ${response.statusCode}: ${response.body}',
      );
    }

    final envelope = jsonDecode(response.body);
    final recipes = jsonDecode(envelope);

    

  }

  String _buildPrompt(UserInput input) {
    final include = input.ingredToInclude;
    final atHome = input.ingredAtHome;

    return '''
You are helping plan a home-cooked meal in Sweden.
 
Search the web and find 3 REAL, EXISTING recipes published on real recipe sites.
Do not invent recipes. Do not combine recipes.
 
Constraints:
- Total ingredient cost per recipe: at most ${input.budget} SEK
- Servings: ${input.servings}
- Maximum active cooking time: ${input.timeToCook} minutes
- Cook's skill level: ${input.skillLevel}
${include.isEmpty ? '' : '- Must use these ingredients: $include'}
${atHome.isEmpty ? '' : '- The cook already owns: $atHome'}
 
For each recipe:
- Scale all ingredient amounts to exactly ${input.servings} servings.
- Estimate costs in Swedish kronor at typical ICA/Coop 2026 prices.
  "cost" is the cost of the amount used, not a whole package.
- Set "has" to true for any ingredient the cook already owns (listed above),
  false otherwise.
- "totalCost" must equal the sum of the ingredient costs whose "has" is false.
- "imageURL" must be a direct link to an image file the recipe page itself
  uses. If you are not confident such a URL exists, return null.
- Write steps as short, plain imperative sentences.
''';
  }

  static const Map<String, dynamic> _schema = {
    'type': 'object',
    'properties': {
      'recipes': {
        'type': 'array',
        'minItems': 3,
        'maxItems': 3,
        'items': {
          'type': 'object',
          'properties': {
            'name': {'type': 'string', 'description': 'Recipe name.'},
            'servings': {'type': 'integer'},
            'timeToCook': {
              'type': 'integer',
              'description': 'Active cooking time in minutes.',
            },
            'totalCost': {
              'type': 'number',
              'description': 'Total cost in SEK of ingredients not already owned.',
            },
            'imageURL': {
              'type': ['string', 'null'],
              'description': 'Direct URL to an image file, or null.',
            },
            'ingredients': {
              'type': 'array',
              'items': {
                'type': 'object',
                'properties': {
                  'name': {'type': 'string'},
                  'amount': {
                    'type': 'string',
                    'description': 'Quantity with units, e.g. "200 g".',
                  },
                  'cost': {'type': 'number', 'description': 'Cost in SEK.'},
                  'has': {
                    'type': 'boolean',
                    'description': 'True if the cook already owns this.',
                  },
                },
                'required': ['name', 'amount', 'cost', 'has'],
              },
            },
            'steps': {
              'type': 'array',
              'items': {'type': 'string'},
            },
          },
          'required': [
            'name',
            'servings',
            'timeToCook',
            'totalCost',
            'ingredients',
            'steps',
          ],
        },
      },
    },
    'required': ['recipes'],
  };
}
