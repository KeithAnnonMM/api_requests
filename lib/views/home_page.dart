import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map responseStore = {};

  Future getApiData() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() {
        responseStore = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 270, 10, 270),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            child: responseStore.isEmpty
                ? const Text('Loading Data',
                    style: TextStyle(color: Colors.black, fontSize: 20))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Email:${responseStore['data']['email'].toString()}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                      Text(
                          'Name:${responseStore['data']['first_name'].toString()} ${responseStore['data']['last_name'].toString()}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/users');
                          },
                          child: const Text('Users'))
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
