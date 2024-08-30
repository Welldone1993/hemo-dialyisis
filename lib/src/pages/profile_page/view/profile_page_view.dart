import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/components/scaffold.dart';

import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/profile_page_controller.dart';
import 'widget/patient_info.dart';
import 'widget/personal_info.dart';
import 'widget/prescription_info.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Hero(
          tag: 'profile',
          child: _body(),
        ),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body() => FractionallySizedBox(
        heightFactor: 0.95,
        widthFactor: 0.95,
        child: DecoratedBox(
          decoration: Decorations.secondaryCardDecoration(),
          child: const Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: PrescriptionInfo()),
                    Expanded(child: PatientInfo()),
                  ],
                ),
              ),
              Expanded(child: PersonalInfo()),
            ],
          ),
        ),
      );
}
