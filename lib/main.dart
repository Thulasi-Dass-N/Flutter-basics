import 'package:flutter/material.dart';
import 'package:flutter_learning/screens/Chat_Screen.dart';
import 'package:flutter_learning/screens/Login_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat Application",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.cyanAccent, foregroundColor: Colors.black),
      ),
      home: LoginScreen(),
      routes: {'/chat': (context) => ChatScreen()},
    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   // routerConfig: RouteApp().router,
    //   // home: LoginScreen(),
    //
    //   // home: randomAnswer(),
    // );
  }
}
