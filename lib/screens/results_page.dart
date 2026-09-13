import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:planeat_mobile_app/testing/mock_recipes.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final List<Recipe> recipesList = mockRecipes;

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
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 5,
          children: [
            //TEXT
            SizedBox(
              height: 65,
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

                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          // Image
                          AspectRatio(
                            aspectRatio: 16 / 5.2,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(5),
                              ),
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
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              verticalDirection: VerticalDirection.down,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    recipe.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                                Row(
                                  spacing: 10,
                                  children: [
                                    AutoSizeText(
                                      '${recipe.totalCost.round()} kr',
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    AutoSizeText(
                                      '${recipe.timeToCook.round()} min',
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
