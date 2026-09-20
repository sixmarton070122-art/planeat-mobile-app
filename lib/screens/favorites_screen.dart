import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:planeat_mobile_app/services/favorites_service.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
          ],
        ),
      ),
    );;
  }
}