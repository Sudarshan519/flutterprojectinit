import 'package:flutter/material.dart';
import 'package:projectinit/controllers/loginController.dart';
import 'package:projectinit/pages/auth/login/auth.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final email = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
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
                  validator: (v) {
                    if (v!.isEmpty)
                      return '* Required';
                    else
                      return null;
                  },
                  controller: email,
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await authController.resetPassword(email.text);
                   

                    // Get.to(() => LoginPage());
                  }
                }),
          ]),
        ),
      ),
    ));
  }
}

class ConfirmResetPage extends StatelessWidget {
  const ConfirmResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final code = TextEditingController();
    final newPassword = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Enter code provided to reset your password?"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: code,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.headline6,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isCollapsed: false,
                          labelText: "Code")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: newPassword,
                      // keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.headline6,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isCollapsed: false,
                          labelText: "NewPassword")),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    label: "Submit",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await authController.confirmReset(
                            newPassword.text, code.text);
                        Get.to(() => LoginPage());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
