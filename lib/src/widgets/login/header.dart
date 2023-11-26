import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 38),
      child: Image.asset('assets/images/logo.png', height: 100, scale: 0.7),
    );
  }
}
