import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import './data/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  Iterable<Meal> _avalibleMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _avalibleMeals = dummyMeals.where((element) {
          if (_filters['gluten']! && !element.isGlutenFree) {
            return false;
          }
          if (_filters['lactose']! && !element.isLactoseFree) {
            return false;
          }
          if (_filters['vegan']! && !element.isVegan) {
            return false;
          }
          if (_filters['vegetarian']! && !element.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? MyApp._defaultLightColorScheme,
          useMaterial3: true,
          fontFamily: 'Raleway',
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? MyApp._defaultDarkColorScheme,
          useMaterial3: true,
          fontFamily: 'Raleway',
        ),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const TabsScreen(),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
                availableMeals: _avalibleMeals,
              ),
          MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(saveFilters: _setFilters, currentFilters: _filters),
        },
      );
    });
  }
}
