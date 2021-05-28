import 'dart:convert';

import 'package:http/http.dart' as http;

const url = "http://192.168.1.2:5000/api/user";
logIn(Map<String, String> data) async {
  final jsonData = jsonEncode(data);
  var response = await http.post("$url/authenticate",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData);
  return response;
}

signUp(Map<String, String> data) async {
  final jsonData = jsonEncode(data);
  var response = await http.post("$url/register",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData);
  return response;
}
