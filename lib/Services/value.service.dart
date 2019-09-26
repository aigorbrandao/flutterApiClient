import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

Future<List<dynamic>> getValues() async {
  final response = await http.get(api + 'values');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    List<dynamic> list = json.decode(response.body);
    return list;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<String> getValue(String token) async {
  final response = await http.get(
    api + 'values/5',
    headers: {"Authorization": "Bearer " + token},
  );

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return response.body;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
