import 'package:flutter/material.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;
import 'package:temp_noti/src/services/api.dart';
import 'package:temp_noti/src/utils/toast.dart';
import 'package:temp_noti/src/widgets/login/input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildForm(),
        _buildSubmitBtn(),
      ],
    );
  }

  Card _buildForm() => Card(
        margin: const EdgeInsets.only(bottom: 22, left: 22, right: 22),
        elevation: 5.0,
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 50),
          child: InputForm(
            usernameController: usernameController,
            passwordController: passwordController,
          ),
        ),
      );

  BoxShadow boxShadowItem(Color color) => BoxShadow(
        color: color,
        offset: const Offset(1.0, 6.0),
        blurRadius: 20.0,
      );

  Container _buildSubmitBtn() {
    const gradientStart = Color.fromARGB(255, 39, 101, 188);
    const gradientEnd = Color.fromARGB(255, 48, 190, 255);
    void submitLogin() {
      usernameController.clear();
      passwordController.clear();
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, custom_route.Route.home);
    }

    return Container(
      width: 200,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          boxShadowItem(gradientStart),
          boxShadowItem(gradientEnd),
        ],
        gradient: const LinearGradient(
          colors: [
            gradientStart,
            gradientEnd,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
        ),
      ),
      child: TextButton(
        onPressed: () async {
          Toast().showLoading(context);
          await Api()
              .checkLogin(usernameController.text, passwordController.text)
              .then((value) {
            submitLogin();
          }).catchError((err) {
            Toast().showAlertBar(context, 'Login Fail!!', err.toString());
          });
          setState(() {});
        },
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
