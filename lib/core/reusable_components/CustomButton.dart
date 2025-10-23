import 'package:evently_c16/core/resources/ColorsManager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  void Function() onPress;
  bool isGoogle = false;
  CustomButton({
    required this.title,
    required this.onPress,
    this.isGoogle = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity, 56),
          backgroundColor: isGoogle
              ? const Color.fromARGB(0, 0, 0, 0)
              : ColorsManager.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: BorderSide(
            color: ColorsManager.primaryColor,
            width: 2,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isGoogle ? ColorsManager.primaryColor : Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      ),
    );
  }
}
