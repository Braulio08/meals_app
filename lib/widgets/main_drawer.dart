import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(
      BuildContext context, String title, IconData icon, VoidCallback function) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: function,
    );
  }

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTitle(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTitle(context, 'Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
