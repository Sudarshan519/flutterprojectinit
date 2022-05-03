import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:projectinit/pages/register/register_success.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final date = TextEditingController();
  final time = TextEditingController();
  final location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(children: [
            const Align(alignment: Alignment.topLeft, child: BackButton()),
            Text(
              "Registration",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Post your gathering \ndetails",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomInputField(
              controller: date,
              label: "Enter Date",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomInputField(
              label: "Enter time",
              controller: time,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomInputField(
              controller: location,
              label: "Enter location",
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: CustomButton(
                    label: "Register",
                    route: () => Get.to(() => const RegistrationSuccess()))),
            const SizedBox(
              height: 30,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Want to register for \ngathering?",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              TextSpan(
                text: "\tRegister",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ])),
          ]),
        ),
      ),
    );
  }
}
