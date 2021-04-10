import 'package:flutter/material.dart';
import 'package:mael_app/screens/category_male_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMaleScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        onTap: () => selectCategory(context),
        child: Container(
            padding: EdgeInsets.all(15),
            child: Text(title, style: Theme.of(context).textTheme.title),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.6), color]),
              color: color,
              borderRadius: BorderRadius.circular(15),
            )));
  }
}
