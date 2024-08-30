import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_page_controller.dart';

class PatientInfo extends GetView<ProfilePageController> {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) => const FractionallySizedBox(
    widthFactor: 0.9,
    heightFactor: 0.9,
    child: Placeholder(),
  );
}
