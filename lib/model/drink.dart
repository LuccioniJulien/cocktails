import 'package:cocktails/helper/apiCall.dart';
import 'dart:async';

class Drink {
  int id;
  String name;
  String urlImage;
  String instruction;
  bool isUpdated = false;
  List<String> tags = new List<String>();
  Map<String,String> ingerdients = new Map<String,String>();

  Drink();

  Drink.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['idDrink']),
      name = json['strDrink'],
      urlImage  = json['strDrinkThumb'];

  /// get all the id by category
  static Future<List<Drink>> fetchDrinkId(String category) async {
    final response = await Api.call('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$category');
    List<Drink> temp = new List<Drink>();
    for (var item in response) {
        temp.add(Drink.fromJson(item));
    }
    return temp;
  }

  /// get drink's details by id
  Future updateDrink() async {
      final response = await Api.call('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id');
      var attributes = response[0];
      instruction = attributes["strInstructions"];

      if(attributes['strCategory']!=null){
         this.tags.add(attributes['strCategory']);
      }
      if(attributes['strIBA']!=null){
         this.tags.add(attributes['strIBA']);         
      }
      if(attributes['strAlcoholic']!=null){
         this.tags.add(attributes['strAlcoholic']);
      }
      if(attributes['strGlass']!=null){
         this.tags.add(attributes['strGlass']);
      }

      for (var i = 1; i < 16; i++) {
        var ingredient = attributes['strIngredient$i'];
        var measure = attributes['strMeasure$i'];

        if(ingredient == "" || ingredient == null)
        {
          break;
        }
        this.ingerdients[ingredient] = measure ;
      }
      this.isUpdated = true;
  }
}