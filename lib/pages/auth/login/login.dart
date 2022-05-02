import 'package:flutter/material.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[200],
      ),
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 18,
              ),
              Image.network(
                  "https://images.unsplash.com/photo-1598816379790-43364e52c3e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHdlbGNvbWUlMjBsb2dpbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
              const SizedBox(
                height: 18,
              ),
              const CustomInputField(label: "9377372772"),
              const SizedBox(
                height: 18,
              ),
              const CustomInputField(label: "********"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Forget Password",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.red,
                    ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        Get.dialog(AlertDialog(
                          content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Center(child: CircularProgressIndicator())
                              ]),
                        ));
                        Future.delayed(3.seconds, () {
                          Get.back();
                          Get.to(() => const HomePage());
                        });
                      },
                      child: const Text("Login")))
            ],
          ),
        ),
      ),
    );
  }
}
