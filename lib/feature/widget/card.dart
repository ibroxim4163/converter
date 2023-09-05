import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'custom_dropdown_button.dart';
import '../provider/inherited_widget.dart';
import 'custom_text.dart';
import 'custom_text_field.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final dataProvider = MyProvider.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: SizedBox(
        height: 260,
        child: DecoratedBox(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomText(
                    text: localization?.amount??"",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownButton(
                      value: dataProvider.cities.first.ccy,
                      onChange: dataProvider.dropDownOnChange1,
                    ),
                    CustomTextField(
                      enabled: true,
                      controller: dataProvider.controller1,
                      textOnChange: dataProvider.onChangeFirst,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  endIndent: 10,
                  indent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomText(
                    text: localization?.converted_amount ?? "",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownButton(
                      onChange: dataProvider.dropDownOnChange2,
                      value: dataProvider.cities[1].ccy,
                    ),
                    CustomTextField(
                      enabled: false,
                      controller: dataProvider.controller2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
