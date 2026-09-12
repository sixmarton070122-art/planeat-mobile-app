import 'ingredient.dart';

class Recipe {
  final String name;
  final List<Ingredient> ingredients;
  final List<String> steps;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.steps
  });

}