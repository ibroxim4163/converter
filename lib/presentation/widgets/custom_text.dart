import 'package:flutter/material.dart';

import '../../data/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomText({
    required this.text,
    this.fontSize = 14,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: AppColors.amountColor,
      ),
    );
  }
}
