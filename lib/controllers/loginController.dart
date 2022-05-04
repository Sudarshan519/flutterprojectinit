import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:projectinit/pages/home/homepage.dart';

class LoginController extends GetxController {
  var loginService = LoginService();
  login(String email, String password, context) async {
    // print(email);
    // print(password);
    Response resp = await loginService.login(email, password);
    Get.back();
    if (resp.statusCode == 200) {
      print(resp.body);
      Get.back();
      Get.to(() => const HomePage());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(resp.statusText!)));
    } else {
      print(resp.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
    }
  }
}

class LoginService extends GetConnect {
  login(String email, String password) async {
    var loginUrl =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBQLrTzPdCEEwltsuEp_qtF3E3SzJrYZ1U&email=$email&password=$password";
    var resp = await post(loginUrl, {});

    return resp;
  }

  signup() {}
  signout() {}
}
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
