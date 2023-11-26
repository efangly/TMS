import 'package:flutter/material.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: custom_route.Route.getAll(),
      title: 'ThanesAlert',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
    );
  }
}
