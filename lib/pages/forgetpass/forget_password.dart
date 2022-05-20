import 'package:flutter/material.dart';
import 'package:projectinit/pages/auth/login/auth.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(children: [
          Text(
            "Forgot Password",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.headline6,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isCollapsed: false,
                    labelText: "Email")),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              label: "Submit",
              onPressed: () {
                Get.to(() => LoginPage());
              }),
        ]),
      ),
    ));
  }
}
