import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomChip extends StatefulWidget {
  const CustomChip({
    super.key,
    required this.label,
    required this.action,
  });

  final String label;
  final void Function() action;

  @override
  State<CustomChip> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomChip> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) => _chip();

  Widget _chip() => InputChip(
        elevation: 0,
        label: Text(
          widget.label,
          style: const TextStyle(
            fontFamily: Constants.iranSansFont,
            fontWeight: FontWeight.w300,
          ),
        ),
        selected: _isSelected,
        onSelected: (value) {
          setState(() {
            _isSelected = !_isSelected;
            widget.action();
          });
        },
        backgroundColor: Constants.deSelectedChipColor,
        selectedColor: Constants.selectedChipColor,
        labelStyle: TextStyle(
          color: _isSelected
              ? Constants.whiteColor
              : Constants.deSelectedChipTextColor,
        ),
        shape: StadiumBorder(
          side: BorderSide(
            color: _isSelected
                ? Colors.transparent
                : Constants.deSelectedChipBorderColor,
            width: 2.0,
          ),
        ),
        showCheckmark: false,
        deleteIcon: _isSelected ? _checkmarkIcon() : null,
        onDeleted: _isSelected
            ? () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              }
            : null,
        deleteButtonTooltipMessage: '',
      );

  Widget _checkmarkIcon() => const Icon(
        Icons.check,
        color: Constants.whiteColor,
      );
}
