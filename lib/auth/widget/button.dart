import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.buttonName});

  final buttonName;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 400,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          '$buttonName',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ));
  }
}
