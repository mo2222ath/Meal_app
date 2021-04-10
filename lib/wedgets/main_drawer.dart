import 'package:flutter/material.dart';
import 'package:mael_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget creatListTail(String text, IconData icon, Function taphandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text, style: TextStyle(fontSize: 24, fontFamily: 'Raleway')),
      onTap: taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text('Cooking Up!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).accentColor,
                )),
          ),
          SizedBox(height: 20),
          creatListTail('Meal', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          creatListTail('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
