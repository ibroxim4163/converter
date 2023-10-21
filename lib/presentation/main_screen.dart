import 'package:flutter/material.dart';

import '../../data/constants/app_colors.dart';
import '../data/l10n/app_localizations.dart';
import '../logic/main_bloc/main_bloc.dart';
import 'widgets/card.dart';
import 'widgets/custom_text.dart';
import 'widgets/language_picker_widget.dart';
import 'widgets/rate_part.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    if (context.watch<MainBloc>().state is LoadingState) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          actions: const [
            LanguagePickerWidget(),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                localization.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: AppColors.titleColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                child: Center(
                  child: CustomText(
                    text: localization.subtitle,
                  ),
                ),
              ),
              const CustomCard(),
              const RatePart(),
            ],
          ),
        ),
      );
    }
  }
}
