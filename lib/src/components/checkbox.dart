import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.label,
    required this.action,
  });

  final String label;
  final void Function() action;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) => _checkbox();

  Widget _checkbox() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: AutoSizeText(
              widget.label,
              style: const TextStyle(
                fontFamily: Constants.iranSansFont,
                fontWeight: FontWeight.w500,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          Constants.mediumHorizontalSpacer,
          Checkbox(
            value: _isSelected,
            onChanged: (value) {
              setState(
                () {
                  _isSelected = !_isSelected;
                  widget.action();
                },
              );
            },
          )
        ],
      );
}
