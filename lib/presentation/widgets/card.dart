import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/l10n/app_localizations.dart';
import '../../logic/main_bloc/main_bloc.dart';
import 'custom_dropdown_button.dart';
import 'custom_text.dart';
import 'custom_text_field.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late final TextEditingController controller1;
  late final TextEditingController controller2;

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: SizedBox(
        height: 260,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomText(
                  text: localization.amount,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<MainBloc, MainState>(
                    buildWhen: (previous, current) =>
                        previous.firstCurrency != current.firstCurrency,
                    builder: (context, state) {
                      return CustomDropDownButton(
                        value: state.firstCurrency,
                        onChange: (currency) {
                          context.read<MainBloc>().add(
                                UpdateFirstCurrency(
                                  firstCurrecy: currency ?? "",
                                  value: controller1.text,
                                ),
                              );
                        },
                      );
                    },
                  ),
                  CustomTextField(
                    enabled: true,
                    controller: controller1,
                    textOnChange: (summ) {
                      context.read<MainBloc>().add(UpdateInput(summ));
                    },
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
                  text: localization.converted_amount,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<MainBloc, MainState>(
                    builder: (context, state) {
                      return CustomDropDownButton(
                        onChange: (currency) {
                          context.read<MainBloc>().add(
                                UpdateSecondCurrency(
                                  secondCurrency: currency ?? "",
                                  value: controller1.text,
                                ),
                              );
                        },
                        value: state.secondCurrency,
                      );
                    },
                  ),
                  BlocBuilder<MainBloc, MainState>(
                    buildWhen: (previous, current) =>
                        previous.convertedCurrency != current.convertedCurrency,
                    builder: (context, state) {
                      controller2.text = state.convertedCurrency;
                      return CustomTextField(
                        enabled: false,
                        controller: controller2,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
