import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shortly/logic/cubit/link_cubit.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class LinksList extends StatelessWidget {
  const LinksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LinkCubit, LinkState>(
      buildWhen: (previous, current) => previous.links != current.links,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: state.links.reversed
              .map(
                (link) => _LinkItem(
                  originalUrl: link.original,
                  shortenUrl: link.shorten,
                ),
              )
              .toList(),
        );
      },
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
          GestureDetector(
            onTap: () => launchUrl(Uri.parse(widget.shortenUrl)),
            child: Text(
              widget.shortenUrl,
              style: textTheme.bodyLarge!.copyWith(
                color: AppColors.primary,
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _isCopying
              ? renderSizedLoadingIndicator(size: 25)
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
