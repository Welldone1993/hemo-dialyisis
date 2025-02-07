import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/profile_page_controller.dart';

class Prescription extends GetView<ProfilePageController> {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.secondaryCardDecoration(),
        child: const FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.95,
          child: Placeholder(),
        ),
      );

// Widget _body() => Obx(
//       () => DecoratedBox(
//         decoration: Decorations.secondaryCardDecoration(),
//         child: FractionallySizedBox(
//           heightFactor: 0.95,
//           widthFactor: 0.95,
//           child: controller.canShowData.value ? _data() : const SizedBox(),
//         ),
//       ),
//     );

// Widget _data2() => const Row(
//       children: [
//         Expanded(
//           child: Column(
//             children: [
//               Expanded(flex: 3, child: PrescriptionInfo()),
//               Expanded(flex: 5, child: PatientInfo()),
//             ],
//           ),
//         ),
//         Expanded(child: PersonalInfo()),
//       ],
//     );
}
