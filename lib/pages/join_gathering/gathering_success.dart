import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/widgets/reusable.dart';

class GatheringSuccess extends StatelessWidget {
  const GatheringSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              getTitleText(context, "Joining Success"),
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                  size: 90,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                // margin: const EdgeInsets.symmetric(horizontal: 60),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                height: 200,
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  "Judy's Meeting Group \nDate-18/09/2022 \nTime-6:00 pm \nLocation=Auburn Central",
                  style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 18,
                    height: 1.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              titleText(context, "Please click done to reurn to \n main page"),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                    color: Colors.red[600],
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    child: Text(
                      "Done",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    )),
              )
            ]),
      )),
    );
  }
}
