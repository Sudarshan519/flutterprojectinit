import 'package:flutter/material.dart';
import 'package:projectinit/controllers/loginController.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:get/get.dart';
import 'package:projectinit/utils/validators.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final loginController = Get.put(
    AuthController(),
  );
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'assets/login.png',
                  height: 250,
                ),
                // Text(
                //   "Welcome Back ",
                //   style: Theme.of(context)
                //       .textTheme
                //       .headline4!
                //       .copyWith(color: Colors.black),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Icon(
                //   FontAwesomeIcons.heartPulse,
                //   size: 120,
                //   color: Colors.red,
                // ),
                // Text(
                //   "Heart Support",
                //   textAlign: TextAlign.end,
                //   style: Theme.of(context)
                //       .textTheme
                //       .headline3!
                //       .copyWith(color: Colors.red),
                // ),
                // const SizedBox(
                //   height: 18,
                // ),
                const SizedBox(
                  height: 46,
                ),
                CustomInputField(
                    validator: validateEmail,
                    controller: email,
                    label: "example@email.com"),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  validator: validatePassword,
                  obscureText: true,
                  label: "********",
                  controller: password,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (() {
                    Get.to(ForgetPassword());
                  }),
                  child: Text(
                    "Forget Password",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            {
                              loginController.login(
                                  email.text, password.text, context);
                            }
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SignupPage());
                  },
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account ?\n ",
                          style: Theme.of(context).textTheme.headline6!),
                      TextSpan(
                        text: " Register ",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.red),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final AuthController authController = Get.find();
  SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Welcome \nto Heart Support Australia ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 46,
                ),
                CustomInputField(
                    validator: validateIsEmpty,
                    controller: username,
                    label: "Enter your name"),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  label: "Enter your email",
                  validator: validateEmail,
                  controller: email,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  obscureText: true,
                  label: "Enter password",
                  validator: validatePassword,
                  controller: password,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  obscureText: true,
                  label: "Confirm password",
                  controller: cpassword,
                  validator: (String? v) {
                    if (v! == "") {
                      return '* Required';
                    } else if (v == password.text) {
                      return null;
                    } else {
                      return "Password don't match";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            {
                              authController.signup(email.text, password.text,
                                  username.text, context);
                            }
                            // email.clear();
                            // password.clear();
                            // cpassword.clear();
                          }
                        },
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ))),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Already have account \n ",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                      ),
                      TextSpan(
                        text: " Sign in ",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.red),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final password = TextEditingController();
    final cpassword = TextEditingController();
    final AuthController authController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 25),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: CustomInputField(
                      obscureText: true,
                      label: "Enter new password",
                      validator: validatePassword,
                      controller: password,
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: CustomInputField(
                      obscureText: true,
                      label: "Confirm password",
                      validator: validatePassword,
                      controller: password,
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              Get.to(LoginPage());
                            },
                            child: Text(
                              "Submit",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            )),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
