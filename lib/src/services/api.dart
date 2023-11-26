import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_noti/src/constants/timer.dart';
import 'package:temp_noti/src/constants/url.dart';
import 'package:temp_noti/src/models/login.dart';

class Api {
  Api._internal();

  static final Api _instance = Api._internal();
  factory Api() => _instance;

  static final _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          options.baseUrl = URL.BASE_URL;
          options.headers['Authorization'] = prefs.getString('token') ?? '';
          options.connectTimeout = Timer.CONNECT_TIMEOUT;
          options.receiveTimeout = Timer.RECEIVE_TIMEOUT;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          print(e);
          return handler.next(e);
        },
      ),
    );

  Future<int?> checkLogin(String username, String password) async {
    final Response response = await _dio.post('/login', data: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Login valueMap = loginFromJson(jsonEncode(response.data));
      await prefs.setString('userid', valueMap.userId);
      await prefs.setString('username', valueMap.username);
      await prefs.setString('token', valueMap.token);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
}
