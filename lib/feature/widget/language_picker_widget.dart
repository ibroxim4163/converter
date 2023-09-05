import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants/app_colors.dart';
import '../../l10n/l10n.dart';
import '../provider/local_provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalProvider>(context);
    final locale = provider.locale ?? const Locale('en');
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        dropdownColor: AppColors.whiteColor,
        focusColor: AppColors.whiteColor,
        elevation: 0,
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);

            return DropdownMenuItem(
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocalProvider>(context, listen: false);

                provider.setLocale(locale);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Center(
                  child: CircleFlag(
                    flag,
                    size: 40,
                  ),
                ),
              ),
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
