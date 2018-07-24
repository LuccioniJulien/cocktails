import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Category {
  String name;
  
  Category.fromJson(Map<String, dynamic> json)
      : name = json['strCategory'];

  static Future<List<Category>> fetchPost() async {
    final response = await http.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list');
    final data = json.decode(response.body);
    List<Category> temp = new List<Category>();
    for (var item in data['drinks']) {
      temp.add(Category.fromJson(item));
    }
    return temp;
  }
}