import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  InputField({super.key, required this.label, this.suffixIcon,this.obscureText, required  this.controller});

  final controller;
  final label;
  IconButton? suffixIcon;
  bool? obscureText= false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.orange,
          ),
        ),
        label: Text(
          '$label',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText!,
    );
  }
}
