import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    required this.label,
    required this.labelStyle,
    required this.onPressed,
    required this.primaryColor,
    this.padding,
    required this.radius,
  });

  final double radius;
  final VoidCallback onPressed;
  final Color primaryColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle labelStyle;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: padding,
      ),
      child: Text(
        label,
        style: labelStyle,
      ),
    );
  }
}
