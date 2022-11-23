import 'package:http/http.dart';
import 'dart:convert';

class UsersController {
  Future<Map> getUserData() async {
    Response response;
    response = await get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null as Map;
  }
}
