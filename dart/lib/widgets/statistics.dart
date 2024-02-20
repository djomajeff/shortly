import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/utils.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final items = [
      {
        'title': 'Brand Recognition',
        'description':
            'Boost your brand recognition with each click. Generic links don\'t mean a thing. Branded links help instil confidence in your content',
        'icon': kBrandIcon,
      },
      {
        'title': 'Detailed Records',
        'description':
            'Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions',
        'icon': kDetailedIcon,
      },
      {
        'title': 'Fully Customizable',
        'description':
            'Improve brand awareness and content discoverability through customizable links, supercharging audience engagement',
        'icon': kFullyCustomIcon,
      }
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 52),
          child: Column(
            children: [
              Text(
                'Advanced Statistics',
                style:
                    textTheme.headlineMedium?.copyWith(color: AppColors.accent),
              ),
              const SizedBox(height: 12),
              Text(
                'Track how your links are performing across the web with our advanced statistics dashboard',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.grayShade2,
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: AppColors.primary,
              width: 7,
              height: 400,
            ),
            Column(
              children: [
                ...items
                    .map(
                      (e) => _StatItem(
                        title: e['title']!,
                        description: e['description']!,
                        icon: e['icon']!,
                      ),
                    )
                    .toList()
              ],
            )
          ],
        )
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title, description, icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 42),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          renderRoundedBox(
            radius: 8,
            padding: const EdgeInsets.symmetric(vertical: 43, horizontal: 18)
                .copyWith(top: 52),
            backgroundColor: Colors.white,
            shadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              )
            ],
            child: Column(
              children: [
                Text(
                  title,
                  style: textTheme.headlineSmall?.copyWith(
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.grayShade2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.accent,
              child: SvgPicture.asset(
                icon,
                height: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
