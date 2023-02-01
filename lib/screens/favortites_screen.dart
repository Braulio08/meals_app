import 'package:flutter/material.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic appBar = AppBar(
      title: const Text('Favorites'),
      centerTitle: true,
    );
    return Scaffold(appBar: appBar,);
  }
}