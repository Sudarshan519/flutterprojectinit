import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/gathering_success.dart';
import 'package:projectinit/pages/join_gathering/widgets/reusable.dart';

class ButtonModel {
  String? title;
  String? route;

  ButtonModel({this.title, this.route});
}

var buttons = <ButtonModel>[
  ButtonModel(title: "Waiting"),
  ButtonModel(title: "Online"),
  ButtonModel(title: "Cafe"),
  ButtonModel(title: "Meeting")
];

class GatheringNearby extends StatelessWidget {
  const GatheringNearby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: getBackButton(context),
              ),
              getTitleText(context, "Join Gathering"),
              const SizedBox(
                height: 30,
              ),
              titleText(context, "Gatherings Near you"),
              const SizedBox(
                height: 30,
              ),
              Row(
                // alignment: WrapAlignment.center,
                children: buttons
                    .map((e) => CustomButton(
                          label: e.title.toString(),
                          onPressed: () {},
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              ...List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    tileColor: Colors.red,
                    onTap: () => Get.to(() => const GatheringSuccess()),
                    title: Text(
                      "Judy,Auburn Central, 18/09",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // InkWell(
              //     onTap: () {
              //       Get.to(() => const GatheringNearby());
              //     },
              //     child: Text.rich(TextSpan(children: [
              //       TextSpan(
              //           text: "Want to register for \ngathering?",
              //           style: Theme.of(context).textTheme.titleLarge!
              //           // .copyWith(color: Colors.white),
              //           ),
              //       TextSpan(
              //         text: "\tRegister",
              //         style: Theme.of(context).textTheme.headline6!.copyWith(
              //             color: Colors.red[700], fontWeight: FontWeight.bold),
              //       ),
              //     ]))),
              // ListTile(
              //   tileColor: Colors.red,
              //   onTap: () => Get.to(() => const GatheringSuccess()),
              //   title: const Text("Judy,Auburn Central, 18/09"),
              // ),
              // ListTile(
              //   tileColor: Colors.red,
              //   onTap: () => Get.to(() => const GatheringSuccess()),
              //   title: const Text("Judy,Auburn Central, 18/09"),
              // ),
              // ListTile(
              //   tileColor: Colors.red,
              //   onTap: () => Get.to(() => const GatheringSuccess()),
              //   title: const Text("Judy,Auburn Central, 18/09"),
              // ),
              // ListTile(
              //   tileColor: Colors.red,
              //   onTap: () => Get.to(() => const GatheringSuccess()),
              //   title: const Text("Judy,Auburn Central, 18/09"),
              // ),
              // const SizedBox(
              //   width: double.infinity,
              //   child: CustomButton(
              //       label: "Judy,Auburn Central, 18/09", route: "route"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const CustomButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        height: 50,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(4),
          color: label == "Waiting" ? Colors.grey : Colors.red,
        ),
        child: Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
