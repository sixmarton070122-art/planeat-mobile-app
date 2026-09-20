import 'package:planeat_mobile_app/models/recipe.dart';
import 'package:planeat_mobile_app/models/ingredient.dart';
import 'package:planeat_mobile_app/models/cooking_step.dart';

final mockRecipes = [
  Recipe(
    name: 'Creamy Chicken Pasta',
    servings: 4,
    timeToCook: 30,
    totalCost: 11.80,
    ingredients: [
      Ingredient(name: 'Penne Pasta', amount: '400 g', cost: 1.80, has: true),
      Ingredient(name: 'Chicken Breast', amount: '400 g', cost: 4.50, has: false),
      Ingredient(name: 'Heavy Cream', amount: '200 ml', cost: 1.50, has: true),
      Ingredient(name: 'Garlic', amount: '3 cloves', cost: 0.30, has: true),
      Ingredient(name: 'Parmesan Cheese', amount: '60 g', cost: 1.70, has: false),
      Ingredient(name: 'Olive Oil', amount: '1 tbsp', cost: 0.50, has: true),
      Ingredient(name: 'Spinach', amount: '100 g', cost: 1.50, has: false),
    ],
    steps: [
      CookingStep(description: 'Cook the pasta according to the package instructions.'),
      CookingStep(description: 'Cut the chicken into bite-sized pieces.'),
      CookingStep(description: 'Heat olive oil in a pan and cook the chicken until golden.'),
      CookingStep(description: 'Add the garlic and cook for another minute.'),
      CookingStep(description: 'Pour in the cream and simmer gently.'),
      CookingStep(description: 'Add the spinach and Parmesan cheese.'),
      CookingStep(description: 'Mix in the cooked pasta and serve hot.'),
    ],
    imageURL: 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
    id: "mock-creamy-pasta"
  ),

  Recipe(
    name: 'Beef Tacos',
    servings: 3,
    timeToCook: 25,
    totalCost: 10.50,
    ingredients: [
      Ingredient(name: 'Ground Beef', amount: '400 g', cost: 4.80, has: false),
      Ingredient(name: 'Taco Shells', amount: '8 pieces', cost: 1.80, has: true),
      Ingredient(name: 'Cheddar Cheese', amount: '100 g', cost: 1.50, has: false),
      Ingredient(name: 'Tomato', amount: '2 pieces', cost: 0.80, has: true),
      Ingredient(name: 'Red Onion', amount: '1 piece', cost: 0.60, has: true),
      Ingredient(name: 'Lettuce', amount: '100 g', cost: 0.80, has: false),
      Ingredient(name: 'Taco Seasoning', amount: '1 packet', cost: 0.20, has: true),
    ],
    steps: [
      CookingStep(description: 'Dice the tomato and red onion.'),
      CookingStep(description: 'Shred the lettuce and cheddar cheese.'),
      CookingStep(description: 'Cook the ground beef in a hot pan.'),
      CookingStep(description: 'Add the taco seasoning and a splash of water.'),
      CookingStep(description: 'Simmer until the beef is fully cooked.'),
      CookingStep(description: 'Warm the taco shells according to the package instructions.'),
      CookingStep(description: 'Fill the shells with beef, vegetables and cheese.'),
    ],
    imageURL: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b',
    id: "mock-beef-tacos"
  ),

  Recipe(
    name: 'Vegetable Stir-Fry',
    servings: 2,
    timeToCook: 20,
    totalCost: 6.90,
    ingredients: [
      Ingredient(name: 'Broccoli', amount: '200 g', cost: 1.20, has: true),
      Ingredient(name: 'Bell Pepper', amount: '1 piece', cost: 1.00, has: false),
      Ingredient(name: 'Carrot', amount: '2 pieces', cost: 0.60, has: true),
      Ingredient(name: 'Mushrooms', amount: '150 g', cost: 1.50, has: false),
      Ingredient(name: 'Soy Sauce', amount: '3 tbsp', cost: 0.50, has: true),
      Ingredient(name: 'Sesame Oil', amount: '1 tbsp', cost: 0.60, has: true),
      Ingredient(name: 'Cooked Rice', amount: '400 g', cost: 1.50, has: false),
    ],
    steps: [
      CookingStep(description: 'Cut all vegetables into bite-sized pieces.'),
      CookingStep(description: 'Heat sesame oil in a large pan or wok.'),
      CookingStep(description: 'Add the carrots and broccoli and stir-fry for a few minutes.'),
      CookingStep(description: 'Add the bell pepper and mushrooms.'),
      CookingStep(description: 'Cook until the vegetables are tender but still slightly crisp.'),
      CookingStep(description: 'Add the soy sauce and mix well.'),
      CookingStep(description: 'Serve over warm cooked rice.'),
    ],
    imageURL: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
    id: 'mock-vegetable'
  ),

  Recipe(
    name: 'Classic Margherita Pizza',
    servings: 2,
    timeToCook: 35,
    totalCost: 7.40,
    ingredients: [
      Ingredient(name: 'Pizza Dough', amount: '1 ball', cost: 1.50, has: true),
      Ingredient(name: 'Tomato Sauce', amount: '150 ml', cost: 1.00, has: true),
      Ingredient(name: 'Mozzarella', amount: '150 g', cost: 2.50, has: false),
      Ingredient(name: 'Cherry Tomatoes', amount: '100 g', cost: 1.20, has: true),
      Ingredient(name: 'Fresh Basil', amount: '1 handful', cost: 0.70, has: false),
      Ingredient(name: 'Olive Oil', amount: '1 tbsp', cost: 0.50, has: true),
    ],
    steps: [
      CookingStep(description: 'Preheat the oven to 230°C.'),
      CookingStep(description: 'Stretch the pizza dough onto a baking tray.'),
      CookingStep(description: 'Spread the tomato sauce evenly over the dough.'),
      CookingStep(description: 'Add sliced mozzarella and cherry tomatoes.'),
      CookingStep(description: 'Bake for 12–15 minutes until the crust is golden.'),
      CookingStep(description: 'Top with fresh basil and drizzle with olive oil.'),
      CookingStep(description: 'Slice and serve immediately.'),
    ],
    imageURL: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002',
    id: "mock-margherita"
  ),

  Recipe(
    name: 'Chicken Fried Rice',
    servings: 3,
    timeToCook: 25,
    totalCost: 9.20,
    ingredients: [
      Ingredient(name: 'Chicken Breast', amount: '300 g', cost: 3.50, has: false),
      Ingredient(name: 'Cooked Rice', amount: '500 g', cost: 1.50, has: true),
      Ingredient(name: 'Eggs', amount: '2 pieces', cost: 0.80, has: true),
      Ingredient(name: 'Carrot', amount: '1 piece', cost: 0.40, has: true),
      Ingredient(name: 'Peas', amount: '100 g', cost: 0.75, has: false),
      Ingredient(name: 'Soy Sauce', amount: '3 tbsp', cost: 0.50, has: true),
      Ingredient(name: 'Spring Onion', amount: '2 pieces', cost: 0.75, has: false),
      Ingredient(name: 'Vegetable Oil', amount: '2 tbsp', cost: 0.30, has: true),
    ],
    steps: [
      CookingStep(description: 'Cut the chicken into small pieces.'),
      CookingStep(description: 'Dice the carrot and spring onion.'),
      CookingStep(description: 'Heat oil in a large pan and cook the chicken.'),
      CookingStep(description: 'Add the carrot and peas and stir-fry.'),
      CookingStep(description: 'Push everything to one side and scramble the eggs.'),
      CookingStep(description: 'Add the cooked rice and mix everything together.'),
      CookingStep(description: 'Add soy sauce and spring onion.'),
      CookingStep(description: 'Stir-fry for a few minutes and serve hot.'),
    ],
    imageURL: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b',
    id: "mock-chicken-fried-rice"
  ),

  Recipe(
    name: 'Creamy Tomato Soup',
    servings: 4,
    timeToCook: 30,
    totalCost: 5.60,
    ingredients: [
      Ingredient(name: 'Tomatoes', amount: '800 g', cost: 2.40, has: true),
      Ingredient(name: 'Onion', amount: '1 piece', cost: 0.50, has: true),
      Ingredient(name: 'Garlic', amount: '2 cloves', cost: 0.25, has: true),
      Ingredient(name: 'Vegetable Stock', amount: '500 ml', cost: 0.60, has: false),
      Ingredient(name: 'Heavy Cream', amount: '100 ml', cost: 0.90, has: true),
      Ingredient(name: 'Olive Oil', amount: '1 tbsp', cost: 0.50, has: true),
      Ingredient(name: 'Basil', amount: '1 handful', cost: 0.45, has: false),
    ],
    steps: [
      CookingStep(description: 'Chop the tomatoes, onion and garlic.'),
      CookingStep(description: 'Heat olive oil in a large pot.'),
      CookingStep(description: 'Cook the onion and garlic until softened.'),
      CookingStep(description: 'Add the tomatoes and vegetable stock.'),
      CookingStep(description: 'Simmer for 20 minutes.'),
      CookingStep(description: 'Blend until smooth.'),
      CookingStep(description: 'Stir in the cream and season to taste.'),
      CookingStep(description: 'Serve with fresh basil on top.'),
    ],
    imageURL: 'https://images.unsplash.com/photo-1547592180-85f173990554',
    id: "mock-tomato-soup"
  ),
];