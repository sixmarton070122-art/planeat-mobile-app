import 'package:hive_ce/hive.dart';
import 'package:planeat_mobile_app/models/ingredient.dart';
import 'package:planeat_mobile_app/models/cooking_step.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int servings;

  @HiveField(2)
  final double timeToCook;

  @HiveField(3)
  final double totalCost;

  @HiveField(4)
  final List<Ingredient> ingredients;

  @HiveField(5)
  final List<CookingStep> steps;

  @HiveField(6)
  final String imageURL;

  @HiveField(7)
  final String id;


  Recipe({
    required this.name,
    required this.servings,
    required this.timeToCook,
    required this.totalCost,
    required this.ingredients,
    required this.steps,
    required this.imageURL,
    required this.id
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] as String,
      servings: json['servings'] as int,
      timeToCook: json['timeToCook'] as double,
      totalCost: json['totalCost'] as double,
      ingredients: List<Ingredient>.generate(
        json['ingredients'].length,
        (index) => Ingredient.fromJson(json['ingredients'][index]),
      ),
      steps: List<CookingStep>.generate(
        json['steps'].length,
        (index) => CookingStep.fromJson(json['steps'][index]),
      ),
      imageURL: json['imageURL'],
      id: json['id']
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'servings': servings,
    'timeToCook': timeToCook,
    'totalCost': totalCost,
    'ingredients': ingredients,
    'steps': steps,
    'imageURL': imageURL
  };
}
