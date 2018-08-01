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
    try 
    {
      if(!widget.drink.isUpdated)
      {
        await widget.drink.updateDrink();
      }
      setState(() { drink = widget.drink; });
    } 
    catch (e) 
    {

    }
  }

  @override
  Widget build(BuildContext context) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drink.name),
        
      ),
       body: drink != null ?
       new Wrap(
         children: drink.tags.map((f){
           return  new Padding(
             padding: EdgeInsets.all(5.0),
            child: new Chip(
              label: new Text(f),
              backgroundColor: Colors.blue,
            ),
           );
         }).toList()
       )
        :
        new Text("loading")
    );
  }
}
