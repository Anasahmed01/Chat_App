import 'package:flutter/material.dart';
import 'package:whatsapp/src/reuseable_widget/text/text.dart';

Widget listTile(
    {required String title,
    required String subtitle,
    required String url,
    required String time}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: ListTile(
      textColor: Colors.white,
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(url),
      ),
      title: CustomText.customSizedText(
        text: title,
        size: 18,
        fontWeight: FontWeight.w500,
      ),
      subtitle: CustomText.customSizedText(
        text: title,
        size: 13,
        fontWeight: FontWeight.w500,
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: CustomText.customSizedText(
            text: title,
            size: 12,
          ),
        ),
      ),
    ),
  );
}
