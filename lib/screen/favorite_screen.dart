import 'package:flutter/material.dart';
import 'package:food_app_10/model/meal.dart';
import 'package:food_app_10/widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('Anda tidak memiliki data favorite'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: favoriteMeals[index].id ,
                title: favoriteMeals[index].title,
                imgUrl: favoriteMeals[index].imgUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability
            );
          },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
