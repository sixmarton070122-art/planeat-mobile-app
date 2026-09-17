import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'screens/home_screen.dart';
import 'models/recipe.dart';
import 'theme.dart';


void main() async {
  await Hive.initFlutter();

  await Hive.openBox<Recipe>('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: const HomeScreen(title: "Welcome to PlanEat!"),
    );
  }
}
