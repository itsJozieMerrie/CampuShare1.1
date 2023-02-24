import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj3/auth_page/auth_page.dart';
import 'package:proj3/homepage/homepage.dart';
import 'package:proj3/login/log_in.dart';
import 'package:proj3/signIn/sign_in.dart';

import '../main.dart';
import '../signUp/verify_email_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();

}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) => Scaffold(

    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong!'));
        } else if (snapshot.hasData) {
          return const VerifyEmailPage();
        } else {
          return AuthPage();
        }
      }
    )
  );
}

