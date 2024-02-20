import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final footerItems = [
      {
        'title': 'Features',
        'links': ['Link Shortening', 'Branded Links', 'Analytics'],
      },
      {
        'title': 'Resources',
        'links': ['Blog', 'Developers', 'Support'],
      },
      {
        'title': 'Company',
        'links': ['About', 'Our Team', 'Careers', 'Contact'],
      }
    ];

    final socialMedia = [
      {
        'icon': FontAwesomeIcons.facebook,
        'link': 'https://www.facebook.com',
      },
      {
        'icon': FontAwesomeIcons.twitter,
        'link': 'https://www.twitter.com',
      },
      {
        'icon': FontAwesomeIcons.pinterest,
        'link': 'https://www.pinterest.com',
      },
      {
        'icon': FontAwesomeIcons.instagram,
        'link': 'https://www.instagram.com',
      }
    ];

    return Container(
      color: AppColors.grayShade3,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            kLogoImage,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                for (final item in footerItems)
                  Column(
                    children: [
                      Text(
                        item['title'] as String,
                        style: textTheme.headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      for (final link in item['links'] as List<String>)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            link,
                            style: textTheme.bodyMedium
                                ?.copyWith(color: AppColors.grayShade2),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final media in socialMedia)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () => launchUrl(Uri.parse(media['link'] as String)),
                    child: FaIcon(
                      media['icon'] as IconData,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
