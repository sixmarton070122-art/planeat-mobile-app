import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:planeat_mobile_app/screens/detailed_recipe_screen.dart';
import 'package:planeat_mobile_app/testing/mock_recipes.dart';
import 'package:planeat_mobile_app/models/user_input.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.userInput});

  final UserInput? userInput;

  @override
  State<ResultsScreen> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsScreen> {
  final List<Recipe> recipesList = (List<Recipe>.from(mockRecipes)..shuffle()).take(3).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AutoSizeText(
          "Recipes",
          style: const TextStyle(
            fontFamily: 'AlteHaasGrotesk',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      //BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          spacing: 5,
          children: [
            //TEXT
            SizedBox(
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      "List of the recipes below",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            //RECIPE LIST
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recipesList.length,
              itemBuilder: (context, index) {
                final recipe = recipesList[index];

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
                            // Image
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

                            // Data row
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}
