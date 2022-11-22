import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  Map mapResponse = {};
  List listResponse = [];

  Future getData() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listResponse.isEmpty
          ? const Center(
              child: Text('Loading'),
            )
          : Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listResponse.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Center(
                          child: Text(
                              'Name: ${listResponse[index]['first_name']}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                        ),
                      );
                    })
              ],
            ),
    );
  }
}
