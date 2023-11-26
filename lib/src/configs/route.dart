import 'package:flutter/material.dart';
import 'package:temp_noti/src/pages/pages.dart';

class Route {
  static const home = '/';
  static const detail = '/detail';
  static const login = '/login';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    detail: (context) => const DetailPage()
  };
}
