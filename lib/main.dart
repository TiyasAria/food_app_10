import 'package:flutter/material.dart';
import 'package:food_app_10/screen/categories_meals_screen.dart';
import 'package:food_app_10/screen/detail_meals_screen.dart';
import 'package:food_app_10/screen/homescreen.dart';

import 'model/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // membuat data untuk list data favoritenya yang berupa list kosong,
  List<Meal> _favoriteMeals = [];
  // func untuk berfungsi index/ jumlah item fav nya
  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else{
      setState(() {
        _favoriteMeals.add(meal.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  // untuk ubah colornya
  bool _isfavorite(String mealId){
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
          ).copyWith(
            secondary: Colors.amber,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'RobotoCondensed',
          textTheme:  ThemeData.light().textTheme.copyWith(
              bodyText1 :  const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1)
              ),
              bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1)
              ),
              headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              )
          )
      ),
      // home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(_favoriteMeals),
        CategoriesMealScreen.routeName : (context) => CategoriesMealScreen(),
        DetailMealScreen.routesName : (context) => DetailMealScreen(_toggleFavorite, _isfavorite),
      },
    );
  }
}


