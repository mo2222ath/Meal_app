import 'package:flutter/material.dart';
import 'package:mael_app/wedgets/main_drawer.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filters';
  Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetrian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetrian = widget.currentFilters['vegetrian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters', style: Theme.of(context).textTheme.title),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetrian': _vegetrian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          buildSwitchListTile(
              'Gluten-Free', 'Only include gluten-free meals.', _glutenFree,
              (newValue) {
            setState(() {
              _glutenFree = newValue;
            });
          }),
          buildSwitchListTile(
              'Lactose-Free', 'Only include lactose-Free meals.', _lactoseFree,
              (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          }),
          buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
              (newValue) {
            setState(() {
              _vegan = newValue;
            });
          }),
          buildSwitchListTile(
              'Vegetrian', 'Only include vegetrian meals.', _vegetrian,
              (newValue) {
            setState(() {
              _vegetrian = newValue;
            });
          }),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
