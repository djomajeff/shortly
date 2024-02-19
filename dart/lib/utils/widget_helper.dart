import 'package:flutter/material.dart';

Widget renderRoundedBox({
  Widget? child,
  Color backgroundColor = Colors.black26,
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
