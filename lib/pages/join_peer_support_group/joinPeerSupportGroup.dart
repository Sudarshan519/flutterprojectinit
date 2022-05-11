import 'package:flutter/material.dart';
import 'package:projectinit/pages/home/allgatherings.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/register/registrationtype.dart';

class JoinPeerSupportGroup extends StatelessWidget {
  JoinPeerSupportGroup({Key? key}) : super(key: key);
  final postCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(children: [
          Text("Join Peer Support Group",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.red)),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            // decoration: const BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(
            //           500,
            //         ),
            //         topRight: Radius.circular(
            //           200,
            //         ),
            //         bottomLeft: Radius.circular(
            //           200,
            //         ),
            //         bottomRight: Radius.circular(
            //           200,
            //         ))),
            height: 250,
            width: double.infinity,
            child: Stack(children: [
              Image.asset("assets/ellipse.png"),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Connect with members of our cardiac community to      share your experiences and benefit from the experiences of others",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomInputField(
                  label: "Enter Postal Code", controller: postCode)),
          const SizedBox(
            height: 50,
          ),
          InkWell(
              onTap: () => Get.to(const RegistrationType()),
              child: Container(
                width: 200,
                alignment: Alignment.center,
                height: 50,
                color: Colors.redAccent[700],
                child: Text(
                  "Find",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              )),
        ]),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
