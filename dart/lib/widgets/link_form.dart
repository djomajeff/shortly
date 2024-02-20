import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class LinksForm extends StatelessWidget {
  const LinksForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return renderRoundedBox(
      radius: 8,
      backgroundColor: AppColors.accent,
      margin: const EdgeInsets.symmetric(vertical: 42),
      child: Stack(
        children: [
          SvgPicture.asset(
            kbgShortenImage,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyInput(
                  hintText: 'Shorten a link here...',
                  radius: 4,
                  fillColor: Colors.white,
                  // errorText: 'oops',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 8),
                MyElevatedButton(
                  label: 'Shorten it!',
                  labelStyle:
                      textTheme.bodyLarge!.copyWith(color: Colors.white),
                  onPressed: () {},
                  primaryColor: AppColors.primary,
                  radius: 4,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
