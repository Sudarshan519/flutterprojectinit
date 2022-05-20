import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:projectinit/pages/register/registerpage.dart';
// var buttons = <ButtonModel>[
//   ButtonModel(title: "Meeing Groups"),
//   ButtonModel(title: "Walking Groups"),
//   ButtonModel(title: "Cafe Groups"),
//   ButtonModel(title: "Online Groups")
// ];

class RegistrationType extends StatelessWidget {
  const RegistrationType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: BackButton()),
              Text(
                "Registration",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Select the type of gathering",
                  style: Theme.of(context).textTheme.titleLarge!
                  // .copyWith(color: Colors.white),
                  ),
              const SizedBox(
                height: 30,
              ),
              ...buttons.map((e) => Container(
                    width: 300,
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: ListTile(
                      onTap: () =>
                          Get.to(() => RegisterPage(), arguments: e.title),
                      tileColor: Colors.red,
                      title: Text(
                        e.title.toString() + " Groups",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
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
            ],
          ),
        ),
      ),
    );
  }
}
