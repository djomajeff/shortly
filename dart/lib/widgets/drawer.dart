import 'package:flutter/material.dart';
import 'package:shortly/widgets/widgets.dart';
import '../utils/utils.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.headlineSmall!.copyWith(color: Colors.white);

    final items = ['Features', 'Pricing', 'Resources', 'Login'];

    return renderRoundedBox(
      backgroundColor: AppColors.accent,
      radius: 8,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...items.sublist(0, items.length - 1).map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: GestureDetector(
                    onTap: Scaffold.of(context).closeDrawer,
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
          Container(
            color: AppColors.grayShade2,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              items.last,
              style: labelStyle,
              textAlign: TextAlign.center,
            ),
          ),
          MyElevatedButton(
            label: 'Sign Up',
            labelStyle: labelStyle,
            onPressed: Scaffold.of(context).closeDrawer,
            primaryColor: AppColors.primary,
            radius: 32,
          )
        ],
      ),
    );
  }
}
