import 'package:flutter/material.dart';
import 'package:proj3/signIn/sign_in.dart';
import 'package:proj3/signUp/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
      isLogin ? SignIn(onClickedSignUp: toggle)
          : SignUp(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
