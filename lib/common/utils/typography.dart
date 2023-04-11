import 'package:flutter/material.dart';

class CustomTypography {
  // 禁止类被实例化
  CustomTypography._();

  static const TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle outline = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
}
