import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_request/Models/TokenResponse.dart';

import 'api.dart';

Future<TokenResponse> postLogin(String userID, String accessKey) async {
  String url = api + 'login';
  String body = '{"userID": "' +
      userID +
      '","accessKey": "' +
      accessKey +
      '","grantType": "password"}';

  final response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    TokenResponse tokenResponse =
        TokenResponse.fromJson(json.decode(response.body));
    return tokenResponse;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}