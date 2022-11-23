import 'package:api_requests/views/home_page.dart';
import 'package:api_requests/views/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/users': (context) => const UserData(),
      },
      home: const HomePage(),
    );
  }
}
