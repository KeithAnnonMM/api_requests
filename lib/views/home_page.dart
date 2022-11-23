import 'package:api_requests/controllers/single_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  void fetchData() async {
    SingleController controller = SingleController();
    Map temp = await controller.getData();

    setState(() {
      if (data.isEmpty) {
        data = temp;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
        child: data.isEmpty
            ? const Center(
                child:
                    Text('Loading Data', style: TextStyle(color: Colors.white)))
            : Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(data['data']['avatar']),
                        radius: 60,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Name :${data['data']['first_name']} ${data['data']['last_name']}',
                      style: const TextStyle(color: Colors.white, fontSize: 23),
                    ),
                    Text(
                      'Email :${data['data']['email']}',
                      style: const TextStyle(color: Colors.white, fontSize: 23),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/users');
                        },
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
