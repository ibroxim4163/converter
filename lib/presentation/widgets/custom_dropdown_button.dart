import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/app_colors.dart';
import '../../logic/main_bloc/main_bloc.dart';

class CustomDropDownButton extends StatefulWidget {
  final void Function(String? currency) onChange;
  final String? value;
  const CustomDropDownButton({
    required this.onChange,
    required this.value,
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  late String? value = widget.value;

  @override
  Widget build(BuildContext context) {
    final currencies = context.read<MainBloc>().state.currencies;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: DropdownButton(
        focusColor: AppColors.whiteColor,
        underline: const SizedBox(),
        value: value,
        style: const TextStyle(
          color: AppColors.currencyColor,
        ),
        items: currencies
            .map(
              (e) => DropdownMenuItem(
                value: e.ccy,
                child: Text(e.ccy),
              ),
            )
            .toList(),
        onChanged: (currency) => setState(
          () {
            value = currency;
            widget.onChange(currency);
          },
        ),
      ),
    );
  }
}
