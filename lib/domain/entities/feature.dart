import 'package:flutter/material.dart';

class Feature {
  String label;
  String? siteUrl;
  bool isEnable = true;
  Color? backGroundColor;

  Feature(this.label,
      {this.siteUrl, this.isEnable = true, this.backGroundColor});
}
