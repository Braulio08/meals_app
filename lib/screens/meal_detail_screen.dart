import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  const MealDetailsScreen(
      {super.key, required this.toggleFavorite, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    final dynamic appBar = AppBar(
      title: Text(meal.title),
      centerTitle: true,
    );
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.3,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                buildSectionTitle(context, 'Ingredients'),
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.25,
                  width: mediaQuery.size.width * 0.95,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          meal.ingredients[index],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    itemCount: meal.ingredients.length,
                  ),
                ),
                buildSectionTitle(context, 'Steps'),
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.3,
                  width: mediaQuery.size.width * 0.95,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    itemCount: meal.steps.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(meal.id),
        child: Icon(isFavorite(meal.id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
