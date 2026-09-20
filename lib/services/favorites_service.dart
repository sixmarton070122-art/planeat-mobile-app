import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:hive_ce/hive.dart';

class FavoritesService {
  final Box<Recipe> _box = Hive.box<Recipe>("favorites");

  Future<void> saveFavorite(Recipe recipe) async {
    await _box.put(recipe.name, recipe);
  }

  Future<void> removeFavorite(Recipe recipe) async {
    await _box.delete(recipe.name);
  }

  Future<List<Recipe>> getFavorites() async {
    return _box.values.toList();
  }

  Future<bool> isFavorite(Recipe recipe) async {
    return _box.containsKey(recipe.name);
  }
}