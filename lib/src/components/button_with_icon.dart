import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomButtonWithIcon extends StatefulWidget {
  const CustomButtonWithIcon({
    super.key,
    this.icon,
    this.child,
    required this.action,
    this.color,
    this.iconColor,
    this.height,
    this.width,
    this.isDisable = false,
  }) : assert(icon != null || child != null, 'Set Child Widget or Icon');

  final IconData? icon;
  final Widget? child;
  final void Function() action;
  final bool? isDisable;
  final Color? color;
  final Color? iconColor;
  final double? height;
  final double? width;

  @override
  State<CustomButtonWithIcon> createState() => _CustomButtonWithIconState();
}

class _CustomButtonWithIconState extends State<CustomButtonWithIcon> {
  double _padding = 6;
  double _margin = 0;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Constants.smallPadding,
        child: SizedBox(
          width: widget.width ?? 40,
          height: widget.height ?? 40,
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
              child: widget.child ??
                  Icon(
                    widget.icon,
                    size: widget.height != null ? (widget.height! / 2) : null,
                    color: widget.iconColor,
                  ),
            ),
          ),
        ),
      );
}
