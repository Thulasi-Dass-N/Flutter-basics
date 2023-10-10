import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore_for_file: camel_case_types

class randomAnswer extends StatefulWidget {
  const randomAnswer({super.key});

  @override
  State<randomAnswer> createState() => _randomAnswerState();
}

class _randomAnswerState extends State<randomAnswer> {
  int answer = 1;

  void randomValue() {
    setState(() {
      answer = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              context.go('/');
              // Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text('Random Answer'),
          backgroundColor: Colors.red[300],
        ),
        backgroundColor: Colors.red[700],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      randomValue();
                    },
                    child: Image.asset('images/ball$answer.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
