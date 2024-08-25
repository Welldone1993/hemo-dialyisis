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
  Widget build(BuildContext context) => Padding(
        padding: Constants.smallPadding,
        child: SizedBox(
          width: MediaQuery.of(context).devicePixelRatio / 0.01,
          height: 50,
          child: _chip(),
        ),
      );

  Widget _chip() => InputChip(
        elevation: 0,
        label: Text(widget.label),
        selected: _isSelected,
        onSelected: (value) {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        backgroundColor: Constants.deSelectedChipColor,
        selectedColor: Constants.selectedChipColor,
        labelStyle: TextStyle(
          color: _isSelected
              ? Constants.whiteTextColor
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
        color: Constants.whiteTextColor,
      );
}
