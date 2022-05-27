import 'package:flutter/material.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:get/get.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var selected = 'pulse';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios)),
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                "Contact Information",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 26,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.headline6,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isCollapsed: false,
                    labelText: "Name"),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.headline6,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isCollapsed: false,
                    labelText: "Phone"),
              ),
              const SizedBox(
                height: 26,
              ),
              const OutlineFormField(label: "Email"),
              const SizedBox(
                height: 26,
              ),
              Text(
                "What services do you require?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  Radio(value: 'pulse', groupValue: 'pulse', onChanged: (v) {}),
                  const Text("Pulse Rate Monitor"),
                ],
              ),
              Row(
                children: [
                  Radio(value: 'heart', groupValue: 'pulse', onChanged: (v) {}),
                  const Text("Pulse Rate Monitor"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 'medication',
                      groupValue: 'pulse',
                      onChanged: (v) {}),
                  const Text("Pulse Rate Monitor"),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              CustomButton(
                  label: "Submit",
                  onPressed: () {
                    Get.back();
                    Get.snackbar("Success", "We will get back to you soon");
                  })
              // const CustomInputField(label: "Email"),
            ]),
      ),
    );
  }
}

class OutlineFormField extends StatelessWidget {
  final String label;
  const OutlineFormField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.headline6,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isCollapsed: false,
          labelText: label),
    );
  }
}
