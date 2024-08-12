import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  Textformfield(
      {super.key,
        required this.lableText,
        required this.controller,
        required this.validate,
        required this.prefixIco,
        required this.suffixIcon,
        required this.isObsecure


      });

  final String lableText;
  String? Function(String?)? validate;
  final TextEditingController controller;
  IconData prefixIco;
  IconData suffixIcon;
  bool isObsecure=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validate,
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            hintText: lableText,

            suffixIcon: Icon(suffixIcon),
            prefixIcon: Icon(prefixIco),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                BorderSide(color: Theme.of(context).colorScheme.error))),
      ),
    );
  }
}
