import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Cocktail {
  String name;
  
  Cocktail.fromJson(Map<String, dynamic> json)
      : name = json['strCategory'];

  static Future<List<Cocktail>> fetchPost() async {
    final response = await http.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list');
    final data = json.decode(response.body);
    List<Cocktail> temp = new List<Cocktail>();
    for (var item in data['drinks']) {
      temp.add(Cocktail.fromJson(item));
    }
    return temp;
  }
}