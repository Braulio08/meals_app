import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Recipes'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('The Recipies For The Category'),
      ),
    );
  }
}
