import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/app_colors.dart';
import '../../data/l10n/l10n.dart';
import '../../logic/language_bloc/language_bloc.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return DropdownButton(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            dropdownColor: AppColors.whiteColor,
            focusColor: AppColors.whiteColor,
            elevation: 0,
            value: state.locale,
            icon: Container(width: 12),
            items: L10n.all.map(
              (locale) {
                final flag = L10n.getFlag(locale.languageCode);

                return DropdownMenuItem(
                  value: locale,
                  onTap: () {
                    context.read<LanguageBloc>().add(
                          ChangeLanguageEvent(locale),
                        );
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
          );
        },
      ),
    );
  }
}
