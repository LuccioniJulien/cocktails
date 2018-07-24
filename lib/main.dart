import 'package:cocktails/screens/categoriesList.dart';
import 'package:flutter/material.dart';

void main() => runApp(new CocktailsApp());

class CocktailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cocktails',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Categories(title: 'Categories'),
    );
  }
}



