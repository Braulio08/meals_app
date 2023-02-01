import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:meals_app/screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
          fontFamily: 'Raleway',
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
          fontFamily: 'Raleway',
        ),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const TabsScreen(),
          CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
          MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
          FiltersScreen.routeName: (context) => const FiltersScreen(),
        },
      );
    });
  }
}
