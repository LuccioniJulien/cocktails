import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cocktails/model/drink.dart';

class CocktailDetails extends StatefulWidget {
  CocktailDetails({Key key, this.drink}) : super(key: key);

  final Drink drink;

  @override
  _CocktailDetails createState() => new _CocktailDetails();
}

class _CocktailDetails extends State<CocktailDetails> {
  Drink drink;

  initState() {
    super.initState();
    _getCocktailDetails();
  }

  _getCocktailDetails() async{
    await widget.drink.updateDrink();
    for (var item in widget.drink.tags) {
      print(item);
    }
    setState(() { drink = widget.drink; });
  }

  @override
  Widget build(BuildContext context) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drink.name),
      ),
       body: drink != null ?
       ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
            new Chip(
              label: new Text(drink?.tags[index]),
            ),
          itemCount: drink?.tags?.length,
        ):
        new Text("loading")
    );
  }
}
