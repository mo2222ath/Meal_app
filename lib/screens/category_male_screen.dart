import 'package:flutter/material.dart';
import 'package:mael_app/models/meal.dart';
import 'package:mael_app/wedgets/male_item.dart';

// ignore: must_be_immutable
class CategoryMaleScreen extends StatefulWidget {
  static const String routeName = 'CategoryMaleScreen';
  List<Meal> avaliableMeals;
  CategoryMaleScreen(this.avaliableMeals);
  @override
  _CategoryMaleScreenState createState() => _CategoryMaleScreenState();
}

class _CategoryMaleScreenState extends State<CategoryMaleScreen> {
  Map<String, String> routeArgs;
  List<Meal> categoryMeal;

  @override
  void didChangeDependencies() {
    routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryMeal = widget.avaliableMeals.where((meal) {
      return meal.categories.contains(routeArgs['id']);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      categoryMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(routeArgs['title'])),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MaleItem(
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
            id: categoryMeal[index].id,
            // removeItem: removeMeal,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
