import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen({super.key, required this.favoriteMeals});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: widget.favoriteMeals[index],

          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
