import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/profile_page_controller.dart';

class PatientInfo extends GetView<ProfilePageController> {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: const FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.8,
          child: Placeholder(),
        ),
      );
}
