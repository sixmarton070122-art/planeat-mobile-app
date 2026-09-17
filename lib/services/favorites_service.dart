import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:hive_ce/hive_ce.dart';

class FavoritesService {

  Future<void> saveFavorite(Recipe recipe) async {
    // Save recipe
  }

  Future<void> removeFavorite(Recipe recipe) async {
    // Remove recipe
  }

  Future<List<Recipe>> getFavorites() async {
    // Get saved recipes
    return [];
  }

  Future<bool> isFavorite(Recipe recipe) async {
    // Check if recipe is saved
    return false;
  }
}