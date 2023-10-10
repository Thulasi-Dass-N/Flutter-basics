import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.teal.shade300,
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/thulasi.jpg'),
              ),
              const Text(
                "Thulasi Dass",
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Software Engineer",
                style: TextStyle(
                  fontFamily: "Source code Pro",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                width: 150.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 25.0,
                      color: Colors.teal[200],
                    ),
                    title: const Text("9500628423")),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 25.0,
                      color: Colors.teal,
                    ),
                    title: Text("thulasi.d@bahwancybertek.com")),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(5.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    context.go('/chat');
                  },
                  child: const Text("Home"))
            ],
          ),
        ),
      ),
    );
  }
}
