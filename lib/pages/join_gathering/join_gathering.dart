import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:projectinit/utils/validators.dart';

class JoinGathering extends StatelessWidget {
  JoinGathering({Key? key}) : super(key: key);
  final date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          // backgroundColor: Colors.pink[300],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(label: "", icon: Icon(Icons.menu)),
                BottomNavigationBarItem(
                    label: "", icon: Icon(Icons.heart_broken)),
                BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
              ]),
          //  Container(
          //   color: Theme.of(context).primaryColor,
          //   child:
          //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //     IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          //     IconButton(onPressed: () {}, icon: const Icon(Icons.heart_broken)),
          //     IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          //     // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          //   ]),
          // ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back,
                        )),
                  ],
                ),
                Text(
                  "Join Gathering",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.red[700]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Find Gathering near you?",
                    style: Theme.of(context).textTheme.headline6!
                    // .copyWith(color: Colors.white),
                    ),
                const SizedBox(
                  height: 130,
                ),
                CustomInputField(
                  validator: validateIsEmpty,
                  controller: date,
                  label: "Enter date",
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 50,
                    width: 180, // width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: const BorderSide(color: Colors.red))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () => Get.to(() => const GatheringNearby()),
                        child: const Text("Find ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)))),
                const SizedBox(
                  height: 130,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const GatheringNearby());
                  },
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Want to register for \ngathering?",
                        style: Theme.of(context).textTheme.titleLarge!
                        // .copyWith(color: Colors.white),
                        ),
                    TextSpan(
                      text: "\tRegister",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.red[700], fontWeight: FontWeight.bold),
                    ),
                  ])),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final validator;
  final bool isEnable;
  final Colors? colors;
  const CustomInputField(
      {Key? key,
      required this.label,
      required this.controller,
      this.obscureText = false,
      this.validator,
      this.isEnable = true,
      this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(label),
          // labelStyle:
          //     const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          contentPadding: const EdgeInsets.only(left: 20),
          fillColor: const Color.fromRGBO(255, 99, 102, 1),
          // errorStyle: const TextStyle(color: Colors.white),
          // prefix: Container(
          //   width: 10,
          // ),

          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          filled: true),
    );
  }
}
