import 'package:flutter/material.dart';
import 'package:flutter_learning/utils/spaces.dart';
import 'package:flutter_learning/widgets/app_button.dart';
import 'package:flutter_learning/widgets/app_input.dart';
// ignore_for_file: file_names

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _userForm = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  loginUser(context) {
    if (_userForm.currentState != null && _userForm.currentState!.validate()) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             ChatScreen(
      //               username: userNameController.text,
      //             )));
      // Navigator.pushNamed(context, '/chat',
      //     arguments: '${userNameController.text}');
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: userNameController.text);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CircleAvatar(
                radius: 50.0,
                foregroundImage: AssetImage('images/thulasi.jpg'),
              ),
              const Text(
                "Login To Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              VerticalSpacing(20),
              // const SizedBox(
              //   height: 20,
              // ),
              Form(
                key: _userForm,
                child: Column(
                  children: [
                    AppInput(
                      hintText: 'Enter Username',
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "username should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    VerticalSpacing(20),
                    AppInput(
                      hidePassword: true,
                      hintText: 'Enter Your Password',
                      controller: passwordController,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "password should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your password";
                        }
                        return null;
                      },
                    ),
                    VerticalSpacing(20),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  label: "Login",
                  buttonIcon: const Icon(Icons.login)),
            ],
          ),
        ),
      ),
    );
  }
}
