import 'package:cocktails/helper/apiCall.dart';
import 'dart:async';

class Category {
  String name;
  
  Category.fromJson(Map<String, dynamic> json)
      : name = json['strCategory'];

  static Future<List<Category>> fetchCategory() async {
    final response =  await Api.call('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list');
    List<Category> temp = new List<Category>();
    for (var item in response) {
      temp.add(Category.fromJson(item));
    }
    return temp;
  }
}