import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/screens/HomeScreen.dart';
import 'package:flutter_herexamen_noah2023/screens/RecipeListScreen.dart';
import 'package:flutter_herexamen_noah2023/screens/RecipeDetailScreen.dart';
import 'package:flutter_herexamen_noah2023/screens/AboutUsScreen.dart'; // Import the AboutUsScreen
import 'package:flutter_herexamen_noah2023/models/recipe.dart';
import 'package:flutter_herexamen_noah2023/data/recipe_api.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatefulWidget {
  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    RecipeListScreen(),
    AboutUsScreen(), // Add the AboutUsScreen to the list
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About Us',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/recipeDetail') {
          final recipe = settings.arguments as Recipe;
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return RecipeDetailScreen(recipe: recipe);
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
