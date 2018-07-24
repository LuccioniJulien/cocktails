import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Api {  
  static Future<dynamic> call(String url) async {
    final response = await http.get(url);
    final data = json.decode(response.body);
    return data['drinks'];
  }
}