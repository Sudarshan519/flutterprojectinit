import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/firebase_options.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
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
        //  scaffoldBackgroundColor: Colors.pink[200],
        primarySwatch: Colors.red,
      ),
      home: SplashPage(),
    );
  }
}
