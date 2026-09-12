import 'package:flutter/material.dart';
import 'package:planeat_mobile_app/models/recipe.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

