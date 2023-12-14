import 'package:flutter/material.dart';
import '../../../../utils/style/color/colors.dart';

Widget callsTile(
    {required String title,
    required String subtitle,
    required String url,
    required icon,
    required icon2}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: ListTile(
        textColor: Colors.white,
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(url),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                icon2,
                size: 17,
                color: AppColors.callIconColor,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(color: AppColors.textColor),
            )
          ],
        ),
        trailing: Icon(
          icon,
          color: AppColors.indicatorTextColor,
        )),
  );
}

Widget floatingButton(icon) {
  return FloatingActionButton(
    backgroundColor: AppColors.indicatorTextColor,
    onPressed: () {},
    child: Icon(
      icon,
    ),
  );
}
