import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cocktails/model/drink.dart';
import 'package:cocktails/screens/cocktailDetails.dart';
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
    setState(() { drinks = result; });
  }

  @override
  Widget build(BuildContext context) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
            new Card(
                  child: new ListTile(
                      leading: Image.network(drinks[index].urlImage,
                      height: 50.0,
                      width: 50.0,
                      ),
                      title:  Text(drinks[index].name),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CocktailDetails(drink:drinks[index])),
                        );
                      }
                ),
             ),
          itemCount: drinks.length,
        ),
    );
  }
}

// (BuildContext context, bool isExpanded){
//                   return new ListTile(
//                     title: new Text(item.name),
//                     leading: Image.network(item.urlImage)
//                   );
//                 },