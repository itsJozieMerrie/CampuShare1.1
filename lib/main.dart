import 'package:flutter/material.dart';
import 'package:proj3/landing_page/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proj3/wrapper/wrapper.dart';
import 'package:proj3/components/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

//final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      //scaffoldMessengerKey: Utils.messengerKey,
      //navigatorKey: navigatorKey,
      //routes: {
      //  '/wrapper' : (context) => Wrapper()
      //},
      debugShowCheckedModeBanner: false,
      home :  MyLandingPage(),
  );
}