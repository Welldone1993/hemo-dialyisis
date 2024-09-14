import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

enum _ButtonState { primary, secondary, outline }

class CustomButtonWithText extends StatefulWidget {
  const CustomButtonWithText({
    super.key,
    required this.label,
    required this.action,
  }) : _buttonState = _ButtonState.primary;

  const CustomButtonWithText.secondary({
    super.key,
    required this.label,
    required this.action,
  }) : _buttonState = _ButtonState.secondary;

  const CustomButtonWithText.outline({
    super.key,
    required this.label,
    required this.action,
  }) : _buttonState = _ButtonState.outline;

  final String label;
  final void Function() action;
  final _ButtonState _buttonState;

  @override
  State<CustomButtonWithText> createState() => _CustomButtonWithTextState();
}

class _CustomButtonWithTextState extends State<CustomButtonWithText> {
  double _padding = 6;
  double _margin = 0;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Constants.smallPadding,
        child: SizedBox(
          width: MediaQuery.of(context).devicePixelRatio / 0.006,
          height: 50,
          child: _containerButton(),
        ),
      );

  Widget _containerButton() => GestureDetector(
        onTapDown: (details) {
          setState(() {
            _padding = 0.0;
            _margin = 6.0;
          });
        },
        onTapUp: (details) {
          setState(() {
            _padding = 6;
            _margin = 0;
          });
          widget.action();
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
              border: Border.all(
                color: Constants.buttonShadowColor,
                width: 1.5,
              ),
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: _getButtonTextColor(),
                    fontFamily: Constants.iranSansFont,
                  ),
                ),
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
        return Constants.whiteColor;
      case _ButtonState.outline:
        return Constants.buttonOutlineTextColor;
    }
  }
}
