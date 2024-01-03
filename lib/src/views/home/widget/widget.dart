import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';

Widget homeTopIcon(icons) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: Icon(
      icons,
      color: AppColors.white,
    ),
  );
}
