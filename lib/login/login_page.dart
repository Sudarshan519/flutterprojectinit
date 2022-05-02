// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/login/signup.dart';
import 'package:projectinit/pages/welcomepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _numController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Image.asset("assets/login.png"),
                ),
                SizedBox(height: 20),
                Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: formField(
                            _numController,
                            'Enter your phone number',
                            (value) {
                              {
                                if (value!.length < 10) {
                                  return "Enter valid phone number";
                                }
                              }
                              {
                                if (value.length > 10) {
                                  return "Enter valid phone number";
                                }
                              }
                              if (value.isEmpty) {
                                return "Phone number required.";
                              }
                              {
                                return null;
                              }
                            },
                            textInputType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: formField(
                            _password,
                            'Enter your password',
                            (value) {
                              if (value!.isEmpty) {
                                return "Password required";
                              }
                              {
                                if (value.length < 8) {
                                  return "Minimum 8 characters required";
                                }
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    color: Colors.red,
                    height: 55,
                    width: double.infinity,
                    child: FlatButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Get.to(WelcomePage());
                          } else {
                            return;
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }

  TextFormField formField(TextEditingController controller, String hintText,
      String? Function(String?) validator,
      {bool obscureText = false,
      TextInputType textInputType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText ? _secureText : obscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                width: 2, style: BorderStyle.none, color: Colors.black)),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _secureText = !_secureText;
                  });
                },
                icon:
                    Icon(_secureText ? Icons.visibility : Icons.visibility_off),
              )
            : SizedBox(
                height: 0.0,
                width: 0.0,
              ),
      ),
      validator: validator,
    );
  }
}
