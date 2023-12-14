import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';

Widget floatingButtonEdit(icon) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: FloatingActionButton(
      mini: true,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      backgroundColor: AppColors.appbarColor,
      onPressed: () {},
      child: Icon(
        icon,
      ),
    ),
  );
}