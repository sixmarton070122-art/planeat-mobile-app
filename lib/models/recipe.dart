import 'package:planeat_mobile_app/models/ingredient.dart';
import 'package:planeat_mobile_app/models/cooking_step.dart';

class Recipe {
  final String name; //Name of the recipe
  final int servings; //Number of servings
  final double timeToCook; //Time to cook
  final double totalCost; //Total cost
  final List<Ingredient> ingredients; //List of ingredients
  final List<CookingStep> steps; //Steps for cooking
  final String imageURL;

  Recipe({
    required this.name,
    required this.servings,
    required this.timeToCook,
    required this.totalCost,
    required this.ingredients,
    required this.steps,
    required this.imageURL
  });

}