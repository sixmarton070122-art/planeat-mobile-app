import 'ingredient.dart';

class Recipe {
  final String name;
  final int servings;
  final double prepTime;
  final double totalCost;
  final List<Ingredient> ingredients;
  final List<String> steps;

  Recipe({
    required this.name,
    required this.servings,
    required this.prepTime,
    required this.totalCost,
    required this.ingredients,
    required this.steps
  });

}