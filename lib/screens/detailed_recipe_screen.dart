import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:planeat_mobile_app/services/favorites_service.dart';

class DetailedRecipeScreen extends StatefulWidget {
  const DetailedRecipeScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<DetailedRecipeScreen> createState() => _DetailedRecipeScreenState();
}

class _DetailedRecipeScreenState extends State<DetailedRecipeScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    final favorite = await FavoritesService().isFavorite(widget.recipe);

    setState(() {
      isFavorite = favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Detailed Recipe",
            style: const TextStyle(
              fontFamily: 'AlteHaasGrotesk',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      //BODY
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          spacing: 5,
          children: [
            //PICTURE AND NAME
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  spacing: 5,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: widget.recipe.imageURL,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.recipe.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //COST AND TIME
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //FIRST COLUMN
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Cooking time",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.recipe.timeToCook.round()} min",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Second Column
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total cost",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.recipe.totalCost.round()} kr",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //THIRD COLUMN
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Servings",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.recipe.servings.round()}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //INGREDIENTS
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: Column(
                    spacing: 5,
                    children: [
                      FittedBox(
                        child: Text(
                          "Ingredients",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: widget.recipe.ingredients.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final ingredient = widget.recipe.ingredients[index];

                          return Padding(
                            padding: const EdgeInsetsDirectional.only(top: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // NAME — flexible width, shrinks to fit if too long
                                    Expanded(
                                      child: Row(
                                        spacing: 5,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsGeometry.directional(
                                                  start: 5,
                                                ),
                                            child: const Icon(
                                              Icons.circle,
                                              size: 5,
                                            ),
                                          ),
                                          Expanded(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                ingredient.name,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    // AMOUNT — fixed size, never shrinks
                                    Padding(
                                      padding:
                                          const EdgeInsetsGeometry.directional(
                                            end: 5,
                                          ),
                                      child: Text(
                                        ingredient.amount,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                  width: double.infinity,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.outline,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //STEPS
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: Column(
                    spacing: 5,
                    children: [
                      FittedBox(
                        child: Text(
                          "Steps",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //Steps list
                      ListView.builder(
                        itemCount: widget.recipe.steps.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final step = widget.recipe.steps[index];

                          return Padding(
                            padding: const EdgeInsetsDirectional.only(top: 5),
                            child: Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        step.description,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: step.isDone,
                                      onChanged: (value) {
                                        setState(() {
                                          step.isDone = value ?? false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                  width: double.infinity,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.outline,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Save button
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  height: 50,
                  width: 115,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isFavorite){
                        FavoritesService().removeFavorite(widget.recipe);
                      }else{
                        FavoritesService().saveFavorite(widget.recipe);
                      }

                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Text(
                      isFavorite ? "Delete": "Save",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
