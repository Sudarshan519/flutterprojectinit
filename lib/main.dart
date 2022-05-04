// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/splash/splash.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Heart Support',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white, //Colors.red,
        // scaffoldBackgroundColor: Colors.pink[200],
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
