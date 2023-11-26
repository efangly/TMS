import 'package:flutter/material.dart';
import 'package:temp_noti/src/widgets/login/header.dart';
import 'package:temp_noti/src/widgets/login/loginform.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 77, 192),
                  Color.fromARGB(255, 165, 190, 202),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 1.0],
              ),
            ),
          ),
          const SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                LoginForm(),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  height: 22,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
