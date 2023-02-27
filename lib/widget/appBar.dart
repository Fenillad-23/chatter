import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color/AppColor.dart';
import 'TextView.dart';

AppBar Appbar(
    String? title, Color textColor, bool normal, Color iconColor, bool leading,
    [List<Widget>? actions, PreferredSizeWidget? bottom]) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: leading ? true : false,
    elevation: 0,
    automaticallyImplyLeading: false,
    leading: leading
        ? IconButton(
            icon: ImageIcon(
              AssetImage('assets/icons/back_arrow.png'),
              color: iconColor,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            },
          )
        : null,
    title: TextView(
      '$title',
      textColor: textColor,
      fontSize: 23,
    ),
    flexibleSpace: normal
        ? Container()
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                gradient: LinearGradient(
                    colors: AppColors.gradient,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight))),
    actions: actions,
    bottom: bottom,
  );
}
