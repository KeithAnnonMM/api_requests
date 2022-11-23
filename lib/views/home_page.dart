import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(30, 350, 30, 0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF12113C), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: const [
            Text('Home Screen', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
