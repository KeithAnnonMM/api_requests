import 'package:api_requests/controllers/users_controller.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  Map mapResponse = {};
  List data = [];

  void getData() async {
    Map temp = await UsersController().getUserData();
    setState(() {
      mapResponse = temp;
      data = mapResponse['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
            : Column(
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data[index]['avatar']),
                                    radius: 30,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name :${data[index]['first_name']} ${data[index]['last_name']}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      'Email :${data[index]['email']}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
