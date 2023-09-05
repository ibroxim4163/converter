import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final bool enabled;
  final void Function(String? summ)? textOnChange;
  final TextEditingController controller;
  const CustomTextField({
    required this.enabled,
    this.textOnChange,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 45,
        width: 120,
        child: TextField(
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.blackColor,
          ),
          onChanged: textOnChange,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            enabled: enabled,
            fillColor: AppColors.textFieldColor,
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
