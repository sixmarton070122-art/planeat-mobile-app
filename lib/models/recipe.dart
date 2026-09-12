import 'ingredient.dart';

class Recipe {
  final String name; //Name of the recipe
  final int servings; //Number of servings
  final double timeToCook; //Time to cook
  final double totalCost; //Total cost
  final List<Ingredient> ingredients; //List of ingredients
  final List<String> steps; //Steps for cooking

  Recipe({
    required this.name,
    required this.servings,
    required this.timeToCook,
    required this.totalCost,
    required this.ingredients,
    required this.steps
  });

}