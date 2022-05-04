import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(children: [
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
            decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isCollapsed: false,
                labelText: "Name"),
          ),
          const SizedBox(
            height: 18,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
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
            "What services do you require ?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
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
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isCollapsed: false,
          labelText: label),
    );
  }
}
