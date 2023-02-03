import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dynamic appBar = AppBar(
      title: const Text('Your filters'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          },
          icon: const Icon(Icons.save),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle(
                  'Gluten-free',
                  'Only inlcude gluten-free meals.',
                  _glutenFree,
                  (newValue) => setState(
                    () => _glutenFree = newValue,
                  ),
                ),
                _buildSwitchListTitle(
                  'Lactose-free',
                  'Only inlcude lactose-free meals.',
                  _lactoseFree,
                  (newValue) => setState(
                    () => _lactoseFree = newValue,
                  ),
                ),
                _buildSwitchListTitle(
                  'Vegetarian',
                  'Only inlcude vegetarian meals.',
                  _vegetarian,
                  (newValue) => setState(
                    () => _vegetarian = newValue,
                  ),
                ),
                _buildSwitchListTitle(
                  'Vegan',
                  'Only inlcude vegan meals.',
                  _vegan,
                  (newValue) => setState(
                    () => _vegan = newValue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
