import 'package:http/http.dart';
import 'dart:convert';

class SingleController {
  Future<Map> getData() async {
    Response response = await get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null as Map;
  }
}
