import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

enum _ButtonState { primary, secondary, outline }

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.action,
  }) : _buttonState = _ButtonState.primary;

  const CustomTextButton.secondary({
    super.key,
    required this.label,
    required this.action,
  }) : _buttonState = _ButtonState.secondary;

  const CustomTextButton.outline({
    super.key,
    required this.label,
    required this.action,
  }) : _buttonState = _ButtonState.outline;

  final String label;
  final void Function() action;
  final _ButtonState _buttonState;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  double _padding = 6;
  double _margin = 0;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Constants.smallPadding,
        child: SizedBox(
          width: MediaQuery.of(context).devicePixelRatio / 0.01,
          height: 50,
          child: _containerButton(),
        ),
      );

  Widget _containerButton() => GestureDetector(
        onTapDown: (details) {
          setState(() {
            _padding = 0.0;
            _margin = 6.0;
            widget.action();
          });
        },
        onTapUp: (details) {
          setState(() {
            _padding = 6;
            _margin = 0;
          });
        },
        child: AnimatedContainer(
          margin: EdgeInsets.only(top: _margin),
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.only(bottom: _padding),
          decoration: BoxDecoration(
            color: Constants.buttonShadowColor,
            borderRadius: BorderRadius.circular(Constants.mediumSpace),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: _getButtonColor(),
              borderRadius: BorderRadius.circular(Constants.mediumSpace),
              border:
                  Border.all(color: Constants.buttonShadowColor, width: 1.5),
            ),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: _getButtonTextColor()),
              ),
            ),
          ),
        ),
      );

  Color _getButtonColor() {
    switch (widget._buttonState) {
      case _ButtonState.primary:
        return Constants.buttonColor;
      case _ButtonState.secondary:
        return Constants.buttonSecondaryColor;
      case _ButtonState.outline:
        return Colors.white;
    }
  }

  Color _getButtonTextColor() {
    switch (widget._buttonState) {
      case _ButtonState.primary:
        return Constants.buttonShadowColor;
      case _ButtonState.secondary:
        return Constants.whiteTextColor;
      case _ButtonState.outline:
        return Constants.buttonOutlineTextColor;
    }
  }
}
