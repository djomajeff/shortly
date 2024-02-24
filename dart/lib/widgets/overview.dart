import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class Overview extends StatelessWidget {
  const Overview({
    super.key,
    required this.onRedirectToForm,
  });

  final VoidCallback onRedirectToForm;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            kIllustrationWorkingImage,
            height: 250,
            width: deviceSize.width,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            'More than just \n shorter links',
            textAlign: TextAlign.center,
            style: textTheme.headlineLarge?.copyWith(color: AppColors.accent),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Build your brand\'s recognition and get detailed insights on how your links are performing.',
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall
                  ?.copyWith(color: AppColors.grayShade2),
            ),
          ),
          MyElevatedButton(
            label: 'Get Started',
            labelStyle: textTheme.bodyLarge!.copyWith(color: Colors.white),
            onPressed: onRedirectToForm,
            primaryColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            radius: 32,
          ),
        ],
      ),
    );
  }
}
