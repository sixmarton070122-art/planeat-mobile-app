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
                  padding: const EdgeInsetsGeometry.directional(top: 6),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: Center(
                        child: ListTile(
                          leading: AutoSizeText(
                            '${recipe.timeToCook.toInt()} min',
                          ),
                          title: AutoSizeText(
                            recipe.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: AutoSizeText(
                            '${recipe.totalCost.round()} kr',
                          ),
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
