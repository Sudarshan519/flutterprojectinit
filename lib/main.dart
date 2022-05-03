// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.pink[200], primarySwatch: Colors.red),
      home: HomePage(),

      title: 'Flutter Demo',

      // theme: ThemeData(
      //     scaffoldBackgroundColor: Colors.pinkAccent.withOpacity(.8),
      //     primarySwatch: Colors.blue,
      //     backgroundColor: Colors.redAccent),
      // home: SafeArea(child: JoinGathering()),
    );
  }
}
