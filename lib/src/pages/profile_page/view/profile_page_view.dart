import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/components/scaffold.dart';

import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body:  Hero(
          tag: 'profile',
          child: FractionallySizedBox(
            heightFactor: 0.85,
            widthFactor: 0.85,
            child: DecoratedBox(
              decoration: Decorations.secondaryCardDecoration(),
            ),
          ),
        ),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );
}
