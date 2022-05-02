// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/login/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String name, phone;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Text(
                  "to Health support Australia",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Image.asset(
                  "assets/signup.png",
                  height: 250,
                ),
                //SizedBox(height: 30),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.person,
                                  size: 25,
                                ),
                                hintText: "Enter your Name",
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.none,
                                        color: Colors.black)),
                                filled: true,
                                // contentPadding: EdgeInsets.all(16),
                                fillColor: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Full name required.";
                              }
                              return null;
                            },
                            onSaved: (name) {
                              name = name!;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.phone,
                                  size: 25,
                                ),
                                hintText: "Enter your Number",
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.none,
                                        color: Colors.black)),
                                filled: true,
                                // contentPadding: EdgeInsets.all(16),
                                fillColor: Colors.white),
                            validator: (value) {
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
                            onSaved: (phone) {
                              phone = phone!;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                  color: Colors.black,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter Password",
                              contentPadding: EdgeInsets.all(20),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                                icon: Icon(_secureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password required";
                              }
                              if (value.length < 8) {
                                return "Minumum 8 characters required.";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                  color: Colors.black,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Confirm Password",
                              contentPadding: EdgeInsets.all(20),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                                icon: Icon(_secureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password required";
                              }
                              if (value.length < 8) {
                                return "Minumum 8 characters required.";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            color: Colors.red,
                            height: 55,
                            width: double.infinity,
                            child: FlatButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Get.to(LoginPage());
                                  } else {
                                    // print("Unsuccessful");
                                  }
                                },
                                child: Text(
                                  "Register",
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
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(LoginPage());
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            )),
                        SizedBox(height: 20),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
