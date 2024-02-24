import 'package:flutter/material.dart';
import 'package:shortly/utils/utils.dart';

Widget renderRoundedBox({
  Widget? child,
  Color? backgroundColor,
  Size? size,
  double radius = 12,
  EdgeInsets? padding,
  EdgeInsets? margin,
  BoxBorder? border,
  Alignment? alignment,
  List<BoxShadow> shadow = const <BoxShadow>[],
}) {
  return Container(
    width: size?.width,
    height: size?.height,
    alignment: alignment,
    margin: margin,
    padding: padding,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: backgroundColor,
      border: border,
      boxShadow: shadow,
    ),
    child: child,
  );
}

Widget renderSizedLoadingIndicator({
  required double size,
  Color? color,
}) {
  return Container(
    alignment: Alignment.center,
    width: size,
    height: size,
    child: CircularProgressIndicator(
      strokeWidth: 3,
      color: color ?? AppColors.primary,
    ),
  );
}
