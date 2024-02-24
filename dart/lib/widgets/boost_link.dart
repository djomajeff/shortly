import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class BoostLink extends StatelessWidget {
  const BoostLink({super.key, required this.onRedirectToForm});

  final VoidCallback onRedirectToForm;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.accent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            kBgBoostImage,
            height: 300,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Boost your links today.',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 12),
              MyElevatedButton(
                label: 'Get Started',
                labelStyle: textTheme.bodyLarge!.copyWith(color: Colors.white),
                onPressed: onRedirectToForm,
                primaryColor: AppColors.primary,
                // padding: EdgeInsets.,
                radius: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
