import 'package:flutter/material.dart';
import 'package:shortly/utils/utils.dart';

class MyInput extends StatelessWidget {
  const MyInput({
    Key? key,
    required this.hintText,
    required this.radius,
    required this.fillColor,
    this.controller,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  final double radius;
  final Color fillColor;
  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  bool get hasError => errorText != null;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: hasError ? AppColors.secondary : AppColors.grayShade2,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: hasError ? AppColors.secondary : AppColors.grayShade2,
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              style: TextStyle(color: AppColors.secondary),
            ),
          ),
      ],
    );
  }
}
