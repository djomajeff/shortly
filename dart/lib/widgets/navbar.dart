import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/utils.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(kLogoImage),
          IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: Icon(
              Icons.menu,
              color: AppColors.grayShade4,
              size: 27,
            ),
          )
        ],
      ),
    );
  }
}
