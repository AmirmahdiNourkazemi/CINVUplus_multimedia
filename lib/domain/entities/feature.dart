import 'package:flutter/material.dart';

class Feature {
  String label;
  String? siteUrl;
  bool isEnable = true;
  Color? iconColor;
  IconData icon;
  String? description;

  Feature({
    required this.label,
    this.siteUrl,
    this.isEnable = true,
    this.iconColor,
    required this.icon,
    this.description
  });
}
