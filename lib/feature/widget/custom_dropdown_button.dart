import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../provider/inherited_widget.dart';

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
     final dataProvider = MyProvider.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: DropdownButton(
        focusColor: Colors.white,
        underline: const SizedBox(),
        value: value,
        style: const TextStyle(
          color: AppColors.currencyColor,
        ),
        items:dataProvider .cities
            .map(
              (e) => DropdownMenuItem(
                value: e.ccy,
                child: Text(e.ccy ?? ""),
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
