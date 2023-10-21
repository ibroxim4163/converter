import 'package:flutter/material.dart';

abstract class L10n {
  static const all = [
    Locale("uz"),
    Locale("en"),
    Locale("ru"),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ru':
        return 'ru';
      case 'uz':
        return 'uz';
      case 'en':
      default:
        return 'us';
    }
  }
}
