import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/constants/app_colors.dart';
import '../provider/inherited_widget.dart';
import '../widget/card.dart';
import '../widget/custom_text.dart';
import '../widget/language_picker_widget.dart';
import '../widget/rate_part.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = MyProvider.of(context);
    final localization = AppLocalizations.of(context);
    if (dataProvider.cities.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
           localization?.title ?? "",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: AppColors.titleColor,
            ),
          ),
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
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Center(
                  child: CustomText(
                    text: localization?.subtitle ?? "",
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
