import 'package:flutter/material.dart';
import 'package:mael_app/models/meal.dart';
import 'package:mael_app/wedgets/male_item.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("No Favorite yet!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (_, index) {
          return MaleItem(
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            id: favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
