import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/auth_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: white),
              backgroundColor: Colors.transparent,
              elevation: 0.0)),
      home: const LoginScreen(),
    );
  }
}
