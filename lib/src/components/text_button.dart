import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.action,
    required this.text,
    this.style,
    this.heroTag,
  });

  final void Function() action;
  final String text;
  final TextStyle? style;
  final String? heroTag;

  @override
  Widget build(BuildContext context) => Hero(
        tag: heroTag ?? text, // استفاده از heroTag یا متن دکمه به عنوان tag
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: action,
            child: AutoSizeText(
              text,
              style: style ??
                  const TextStyle(
                    fontFamily: Constants.iranSansFont,
                    color: Constants.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      );
}
