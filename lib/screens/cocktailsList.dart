import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class Cocktail extends StatefulWidget {
  Cocktail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CocktailsList createState() => new _CocktailsList();
}

class _CocktailsList extends State<Cocktail> {

  initState() {
    super.initState();
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}