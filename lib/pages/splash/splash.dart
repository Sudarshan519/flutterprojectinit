import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projectinit/pages/onboarding/onboard.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  navigate() {
    Timer((const Duration(seconds: 3)), () {
      Get.off(() => const OnBoardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    navigate();
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Animator<double>(
          //   cycles: 0,
          //   duration: const Duration(milliseconds: 1000),
          //   tween: Tween<double>(begin: 20, end: 25),
          //   curve: Curves.elasticOut,
          //   builder: (builder, animatorState, child) => Icon(
          //     FontAwesomeIcons.heartPulse,
          //     size: animatorState.value * 5,
          //     color: Colors.red,
          //   ),
          // ),
          Image.asset("assets/splash.gif"),
        ]),
      ),
    );
  }
}
