import 'package:http/http.dart';
import 'dart:convert';

class SingleController {
  Response response;
  Map mapResponse;

  SingleController({required this.response, required this.mapResponse});

  Future<Map> getData() async {
    response = await get(Uri.parse('https://reqres.in/api/users/2'));
    return json.decode(response.body);
  }
}
