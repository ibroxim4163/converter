import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/constants/app_colors.dart';
import '../provider/inherited_widget.dart';

class RatePart extends StatelessWidget {
  const RatePart({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = MyProvider.of(context, true);
    final localization = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              localization?.rate ?? "",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.subtitleColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "1 ${dataProvider.selectedOne} = ${dataProvider.rate}"
              " ${dataProvider.selectedTwo}",
            ),
          ),
        )
      ],
    );
  }
}
