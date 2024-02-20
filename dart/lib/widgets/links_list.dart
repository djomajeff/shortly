import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class LinksList extends StatelessWidget {
  const LinksList({super.key});

  @override
  Widget build(BuildContext context) {
    final links = [
      {
        'o': 'https://api.flutter.dev/flutter/painting/HSLColor-class.html',
        's': 'https://api.flutter.dev/flutter/'
      },
      {
        'o': 'https://api.flutter.dev/flutter/painting/HSLColor-class.html',
        's': 'https://api.flutter.dev/flutter/'
      },
      {
        'o': 'https://api.flutter.dev/flutter/painting/HSLColor-class.html',
        's': 'https://api.flutter.dev/flutter/'
      }
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: links
          .map((link) => _LinkItem(
                originalUrl: link['o']!,
                shortenUrl: link['s']!,
              ))
          .toList(),
    );
  }
}

class _LinkItem extends StatefulWidget {
  const _LinkItem({
    required this.originalUrl,
    required this.shortenUrl,
  });

  final String originalUrl, shortenUrl;

  @override
  State<_LinkItem> createState() => _LinkItemState();
}

class _LinkItemState extends State<_LinkItem> {
  bool _copiedUrl = false;
  bool _isCopying = false;

  void _copyShortenUrl() async {
    setState(() {
      _isCopying = true;
    });
    await Clipboard.setData(ClipboardData(text: widget.shortenUrl));
    setState(() {
      _copiedUrl = true;
      _isCopying = false;
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _copiedUrl = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return renderRoundedBox(
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 3),
        )
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.originalUrl,
            style: textTheme.bodyLarge!.copyWith(color: AppColors.accent),
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            height: 1,
            color: AppColors.grayShade2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: double.maxFinite,
          ),
          Text(
            widget.shortenUrl,
            style: textTheme.bodyLarge!.copyWith(
              color: AppColors.primary,
              fontSize: 15,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          _isCopying
              ? Container(
                  alignment: Alignment.center,
                  width: 22,
                  height: 22,
                  child: const CircularProgressIndicator(),
                )
              : MyElevatedButton(
                  label: _copiedUrl ? 'Copied!' : 'Copy',
                  labelStyle:
                      textTheme.bodyLarge!.copyWith(color: Colors.white),
                  onPressed: _copiedUrl ? () {} : _copyShortenUrl,
                  primaryColor:
                      _copiedUrl ? AppColors.accent : AppColors.primary,
                  radius: 4,
                ),
        ],
      ),
    );
  }
}
