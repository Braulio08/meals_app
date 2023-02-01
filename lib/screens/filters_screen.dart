import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic appBar = AppBar(
      title: const Text('gg'),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: const Center(
        child: Text('izi'),
      ),
    );
  }
}
