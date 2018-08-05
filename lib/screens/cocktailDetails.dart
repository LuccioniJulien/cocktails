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
       new Column(
         children: <Widget>[
           new Row(
             children: <Widget>[
               Image.network(drink.urlImage,
                      height: MediaQuery.of(context).size.width * 2/4,
                      width: MediaQuery.of(context).size.width * 2/4,
                      )
             ],
           ),
           new Wrap(
              children: drink.tags.map((f){
                  return  new Padding(
                    padding: EdgeInsets.only(top:10.0,left:4.0,right: 4.0),
                    child: new Chip(
                    label: new Text(f),
                    backgroundColor: Colors.blue,
            ),
           );
         }).toList()
       ),
      new Row(
        children: <Widget>[
        new Padding(
         padding: EdgeInsets.only(left:10.0,top: 10.0),
         child: new Text("Instructions :",
         textAlign: TextAlign.left,
         ), 
       ),
        ],
      ),
       new Padding(
         padding: EdgeInsets.all(10.0),
         child: new Text(drink.instruction,
         textAlign: TextAlign.justify,
         ),
         
       ),
        new Row(
        children: <Widget>[
        new Padding(
         padding: EdgeInsets.only(left:10.0),
         child: new Text("Ingredients :",
         textAlign: TextAlign.left,
         ), 
       ),
        ],
      ),
      new Padding(
        padding: EdgeInsets.only(left:10.0,top: 10.0,right:10.0),
        child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Expanded(
            child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: drink.ingerdients.map((x){
                return new Text(x);
            }).toList(),
          ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: drink.measures.map((x){
                return new Text(x);
            }
            ).toList()
          )
        ],
      ),
      )
         ],
       )
        :
        new Text("loading")
    );
  }
}
