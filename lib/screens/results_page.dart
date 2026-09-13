import 'package:flutter/material.dart';
import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:planeat_mobile_app/testing/mock_recipes.dart';

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
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: FittedBox(
            child: Text(
              "Recipes",
              style: const TextStyle(
                fontFamily: 'AlteHaasGrotesk',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
    );
  }
}

