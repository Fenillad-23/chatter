import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double size;
  final String? semanticLabel;

  AssetIcon(
    this.path, {
    this.color,
    this.size = 24,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      color: color,
      fit: BoxFit.cover,
      semanticLabel: semanticLabel,
    );
  }
}
