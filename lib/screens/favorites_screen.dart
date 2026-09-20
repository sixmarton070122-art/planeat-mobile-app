import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:planeat_mobile_app/screens/detailed_recipe_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AutoSizeText(
          "Favorites",
          style: const TextStyle(
            fontFamily: 'AlteHaasGrotesk',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ValueListenableBuilder<Box<Recipe>>(
        valueListenable: Hive.box<Recipe>('favorites').listenable(),
        builder: (context, box, _) {
          final recipes = box.values.toList();

          if (recipes.isEmpty) {
            return const Center(child: Text('No favorites saved yet.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: Column(
              spacing: 5,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailedRecipeScreen(recipe: recipe),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              spacing: 3,
                              children: [
                                AspectRatio(
                                  aspectRatio: 16 / 5.2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl: recipe.imageURL,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        recipe.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        spacing: 20,
                                        children: [
                                          Text(
                                            '${recipe.totalCost.round()} kr',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${recipe.timeToCook.round()} min',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}