import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:planeat_mobile_app/models/ingredient.dart';

final mockRecipes = [
  Recipe(
    name: 'Spaghetti Bolognese',
    servings: 4,
    timeToCook: 35,
    totalCost: 12.50,
    ingredients: [
      Ingredient(name: 'Spaghetti', amount: '400 g', cost: 2.50),
      Ingredient(name: 'Ground Beef', amount: '500 g', cost: 5.00),
      Ingredient(name: 'Tomato Sauce', amount: '500 ml', cost: 2.00),
      Ingredient(name: 'Onion', amount: '1 piece', cost: 0.50),
      Ingredient(name: 'Garlic', amount: '2 cloves', cost: 0.25),
      Ingredient(name: 'Olive Oil', amount: '2 tbsp', cost: 0.75),
    ],
    steps: [
      'Boil the spaghetti according to the package instructions.',
      'Chop the onion and garlic.',
      'Heat olive oil and cook the onion and garlic.',
      'Add the ground beef and cook until browned.',
      'Add the tomato sauce and simmer for 15 minutes.',
      'Serve the sauce over the spaghetti.',
    ],
  ),

  Recipe(
    name: 'Chicken Fried Rice',
    servings: 3,
    timeToCook: 25,
    totalCost: 9.75,
    ingredients: [
      Ingredient(name: 'Chicken Breast', amount: '300 g', cost: 3.50),
      Ingredient(name: 'Cooked Rice', amount: '500 g', cost: 1.50),
      Ingredient(name: 'Eggs', amount: '2 pieces', cost: 0.80),
      Ingredient(name: 'Carrot', amount: '1 piece', cost: 0.40),
      Ingredient(name: 'Peas', amount: '100 g', cost: 0.75),
      Ingredient(name: 'Soy Sauce', amount: '3 tbsp', cost: 0.50),
      Ingredient(name: 'Vegetable Oil', amount: '2 tbsp', cost: 0.30),
    ],
    steps: [
      'Cut the chicken into small pieces.',
      'Heat oil in a pan and cook the chicken.',
      'Add the carrot and peas.',
      'Add the eggs and scramble them.',
      'Add the cooked rice and mix everything together.',
      'Add soy sauce and stir-fry for a few minutes.',
      'Serve hot.',
    ],
  ),

  Recipe(
    name: 'Vegetable Pasta',
    servings: 2,
    timeToCook: 20,
    totalCost: 7.25,
    ingredients: [
      Ingredient(name: 'Penne Pasta', amount: '250 g', cost: 1.50),
      Ingredient(name: 'Bell Pepper', amount: '1 piece', cost: 1.00),
      Ingredient(name: 'Zucchini', amount: '1 piece', cost: 1.25),
      Ingredient(name: 'Cherry Tomatoes', amount: '150 g', cost: 1.50),
      Ingredient(name: 'Garlic', amount: '2 cloves', cost: 0.25),
      Ingredient(name: 'Olive Oil', amount: '2 tbsp', cost: 0.75),
      Ingredient(name: 'Parmesan Cheese', amount: '50 g', cost: 1.00),
    ],
    steps: [
      'Cook the pasta according to the package instructions.',
      'Chop the vegetables and garlic.',
      'Heat olive oil and sauté the garlic.',
      'Add the vegetables and cook until tender.',
      'Add the cooked pasta and mix well.',
      'Season with salt and pepper.',
      'Top with Parmesan cheese and serve.',
    ],
  ),
];