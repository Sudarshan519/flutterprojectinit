import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/services/authService.dart';

showSnackBar(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

class AuthController extends GetxController {
  final authService = AuthService();
  var loginService = AuthService();
  login(String email, String password, context) async {
    Get.dialog(AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Center(child: CircularProgressIndicator())]),
    ));
    // Response resp = await loginService.login(email, password);
    authService.signin(email, password);
    // if (resp.statusCode == 200) {
    //   var data = resp.body;
    //   // print(data);
    //   Get.back();
    //   Get.to(() => const HomePage(), arguments: data);
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(resp.statusText!)));
    // } else {
    //   Get.back();
    //   print(resp.body);
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
    // }
  }

  signup(String email, String password, context) async {
    Get.dialog(AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Center(child: CircularProgressIndicator())]),
    ));
    // Response resp = await authService.signup(email, password);
    // if (resp.statusCode == 200) {
    //   Get.back();
    //   Get.to(() => const HomePage());
    //   showSnackBar(context, "User created successfully");
    // } else {
    //   Get.back();
    //   var error = resp.body["error"];
    //   var message = error['message'];
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(message == "EMAIL_EXISTS"
    //           ? "Account with email exist"
    //           : "Invalid Credentials")));
    // }
  }
}

// class AuthService extends GetConnect {
//   login(String email, String password) async {
//     var loginUrl =
//         "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBQLrTzPdCEEwltsuEp_qtF3E3SzJrYZ1U&email=$email&password=$password";
//     var resp = await post(loginUrl, {});

//     return resp;
//   }

//   signup(String email, String password) async {
//     var signupUrl =
//         "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBQLrTzPdCEEwltsuEp_qtF3E3SzJrYZ1U";
//     var resp = await post(signupUrl, {"email": email, "password": password});
//     return resp;
//   }

//   signout() {}
// }
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
  });

  String? kind;
  String? localId;
  String? email;
  String? displayName;
  String? idToken;
  bool? registered;

  factory User.fromJson(Map<String, dynamic> json) => User(
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
      };
}
