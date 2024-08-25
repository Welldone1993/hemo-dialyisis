import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.action,
    this.isDisable = false,
  });

  final String label;
  final void Function() action;
  final bool? isDisable;

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
          width: MediaQuery.of(context).devicePixelRatio/0.01,
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
          setState(() {});
          _padding = 6;
          _margin = 0;
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
              color: Constants.buttonColor,
              borderRadius: BorderRadius.circular(Constants.mediumSpace),
              border:
                  Border.all(color: Constants.buttonShadowColor, width: 1.5),
            ),
            child: Center(
              child: Text(
                widget.label,
                style: Constants.boldTextStyle,
              ),
            ),
          ),
        ),
      );

  Widget _button() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          backgroundColor: Constants.buttonColor,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          elevation: Constants.giantSpace,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.giantSpace),
          ),
        ),
        onPressed: widget.isDisable! ? null : widget.action,
        child: Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
}
