import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color/AppColor.dart';
import 'TextView.dart';

AppBar Appbar(String? title, Color textColor, bool normal, Color iconColor,
    [List<Widget>? actions, PreferredSizeWidget? bottom]) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: ImageIcon(
        AssetImage('assets/icons/back_arrow.png'),
        color: iconColor,
        size: 20,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: TextView(
      '$title',
      textColor: textColor,
      fontSize: 23,
    ),
    flexibleSpace: normal
        ? Container()
        : Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: AppColors.gradient,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight))),
    actions: actions,
    bottom: bottom,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
    ),
  );
}
