import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = dummyMeals
        .where(
          (element) => element.categories.contains(routArgs.id),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routArgs.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
