import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.action,
    this.color,
    this.isDisable = false,
  });

  final IconData icon;
  final void Function() action;
  final bool? isDisable;
  final Color? color;

  @override
  State<CustomIconButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomIconButton> {
  double _padding = 6;
  double _margin = 0;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Constants.smallPadding,
        child: SizedBox(
          width: 40,
          height: 40,
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
              color: widget.color ?? Constants.buttonColor,
              borderRadius: BorderRadius.circular(Constants.mediumSpace),
              border:
                  Border.all(color: Constants.buttonShadowColor, width: 1.5),
            ),
            child: Center(
              child: Icon(
                widget.icon,
              ),
            ),
          ),
        ),
      );
}
