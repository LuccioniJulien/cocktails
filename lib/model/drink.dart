import 'package:cocktails/helper/apiCall.dart';
import 'dart:async';

class Drink {
  int id;
  String name;
  String urlImage;

  Drink.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['idDrink']),
        name = json['strDrink'],
        urlImage  = json['strDrinkThumb'];

  /// get all the id by category
  static Future<List<int>> fetchDrinkId(String category) async {
    final response = await Api.call('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$category');
    List<int> temp = new List<int>();
    for (var item in response) {
        temp.add(int.parse(item['idDrink']));
    }
    return temp;
  }

  /// get drink's details by id
  static Future<List<Drink>> fetchDrinkById(List<int> ids) async {
      final List<Drink> temp = new List<Drink>();
      for (var id in ids) {
         final response = await Api.call('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id');
         temp.add(Drink.fromJson(response[0]));
      }
      return temp;
  }
}