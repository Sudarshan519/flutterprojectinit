import 'package:flutter/material.dart';
import 'package:projectinit/controllers/loginController.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final loginController = Get.put(LoginController());
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.pink[200],
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome Back ",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  Icons.heart_broken,
                  size: 120,
                  color: Colors.red,
                ),
                Text(
                  "Heart Support",
                  textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.red),
                ),
                const SizedBox(
                  height: 18,
                ),
                // Text("Sign In",
                //     textAlign: TextAlign.justify,
                //     style: Theme.of(context).textTheme.headline3),
                // Image.network(
                //     "https://images.unsplash.com/photo-1598816379790-43364e52c3e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHdlbGNvbWUlMjBsb2dpbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                const SizedBox(
                  height: 46,
                ),
                CustomInputField(controller: email, label: "9377372772"),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  obscureText: true,
                  label: "********",
                  controller: password,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Password",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ],
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
                          // print(formKey.currentState);
                          print(email.text);
                          print(password.text);
                          if (formKey.currentState!.validate()) {
                            {
                              Get.dialog(AlertDialog(
                                content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Center(child: CircularProgressIndicator())
                                    ]),
                              ));
                            }
                            loginController.login(
                                email.text, password.text, context);
                          }
                        },
                        child: Text(
                          "Login",
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
                        text: "Dont have account \n ",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
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
  final email = TextEditingController();
  final password = TextEditingController();

  SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.pink[200],
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome \nto Heart Support Australia ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Icon(
                //   Icons.heart_broken,
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
                // Text("Sign In",
                //     textAlign: TextAlign.justify,
                //     style: Theme.of(context).textTheme.headline3),
                // Image.network(
                //     "https://images.unsplash.com/photo-1598816379790-43364e52c3e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHdlbGNvbWUlMjBsb2dpbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                const SizedBox(
                  height: 46,
                ),
                CustomInputField(controller: email, label: "Enter your name"),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  label: "Enter your number",
                  controller: password,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  label: "Enter password",
                  controller: password,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  label: "Confirm password",
                  controller: password,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text(
                //       "Forget Password",
                //       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                //             color: Colors.red,
                //           ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          // print(formKey.currentState);
                          if (formKey.currentState!.validate()) {
                            {
                              Get.dialog(AlertDialog(
                                content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Center(child: CircularProgressIndicator())
                                    ]),
                              ));
                            }
                            Future.delayed(3.seconds, () {
                              Get.back();
                              Get.to(() => const HomePage());
                            });
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
                    Get.to(() => LoginPage());
                  },
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Already have account \n ",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
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
