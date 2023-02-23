import 'package:flutter/material.dart';

import '../color/AppColor.dart';
import 'AssetIcon.dart';

Container RoundContainer(double width, double height, String Path, onPressed,
    [double? size]) {
  return Container(
    height: height,
    width: width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryText,
          shape: const CircleBorder()),
      onPressed: onPressed,
      child: AssetIcon(
        Path,
      ),
    ),
  );
}
