// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:practice/constants/globalvariable.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
          color: GlobalVariables.secondaryColor== null ? Colors.white : Colors.black,
        ),
      ),
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        primary:GlobalVariables.secondaryColor,
      ),
    );
  }
}