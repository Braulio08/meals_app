import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final Iterable<Meal> availableMeals;
  const CategoryMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> displayedMeals;
  late Category category;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      category = ModalRoute.of(context)?.settings.arguments as Category;
      displayedMeals = widget.availableMeals
          .where((element) => element.categories.contains(category.id))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: displayedMeals[index],
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
