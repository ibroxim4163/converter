import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/app_colors.dart';
import '../../data/l10n/app_localizations.dart';
import '../../logic/main_bloc/main_bloc.dart';

class RatePart extends StatelessWidget {
  const RatePart({super.key});

  @override
  Widget build(BuildContext context) {
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
              localization.rate,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.subtitleColor,
              ),
            ),
          ),
        ),
        BlocBuilder<MainBloc, MainState>(
          buildWhen: (previous, current) {
            return previous.secondCurrency != current.secondCurrency ||
                previous.firstCurrency != current.firstCurrency;
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1 ${state.firstCurrency} = ${state.rate}"
                  " ${state.secondCurrency}",
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
