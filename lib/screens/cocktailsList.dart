import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cocktails/model/drink.dart';

class Cocktail extends StatefulWidget {
  Cocktail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CocktailsList createState() => new _CocktailsList();
}

class _CocktailsList extends State<Cocktail> {
  List<Drink> drinks = new List<Drink>();

  initState() {
    super.initState();
    _getCocktails();
  }

  _getCocktails() async{
    final result = await Drink.fetchDrinkId(widget.title);
    final drinkslist = await Drink.fetchDrinkById(result);
    for (var item in drinkslist) {
      print(item.name);
    }
    setState(() { drinks = drinkslist; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
            new Card(
                  child: new ListTile(
                      title: new Center(child: Text(drinks[index].name)),
                ),
             ),
          itemCount: drinks.length,
        ),
      ),
    );
  }
}