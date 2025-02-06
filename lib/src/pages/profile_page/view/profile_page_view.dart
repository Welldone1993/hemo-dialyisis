import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/profile_page_controller.dart';
import '../model/enum/profile_header_button_enum.dart';
import 'widget/patient_info.dart';
import 'widget/personal_info.dart';
import 'widget/prescription_info.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body2(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body2() => Obx(
        () => DecoratedBox(
          decoration: Decorations.creamyCardDecoration(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _profileHeaderButton(
                    header: ProfileHeaderButtonEnum.prescription,
                  ),
                  Constants.mediumHorizontalSpacer,
                  _profileHeaderButton(
                    header: ProfileHeaderButtonEnum.info,
                  ),
                ],
              ),
              // Expanded(
              //   child: const FractionallySizedBox(
              //     heightFactor: 0.8,
              //     widthFactor: 0.8,
              //     child: Placeholder(),
              //   ),
              // ),
            ],
          ),
        ),
      );

  Widget _profileHeaderButton({
    required ProfileHeaderButtonEnum header,
  }) =>
      GestureDetector(
        onTap: () => controller.selectedHeader.value = header,
        child: Container(
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(
                color: Constants.disableColor,
              ),
              left: BorderSide(
                color: Constants.disableColor,
              ),
              right: BorderSide(
                color: Constants.disableColor,
              ),
            ),
            color: header == controller.selectedHeader.value
                ? Constants.buttonSecondaryColor
                : Constants.buttonThirdColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Constants.largeSpace),
              bottomRight: Radius.circular(Constants.largeSpace),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.xLargeSpace,vertical: Constants.largeSpace),
            child: Text(
              header.title,
              style: TextStyle(
                fontFamily: Constants.iranSansFont,
                fontWeight: FontWeight.w500,
                color: header == controller.selectedHeader.value
                    ? Constants.whiteColor
                    : Constants.buttonSecondaryColor,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );

  Widget _body() => Obx(
        () => DecoratedBox(
          decoration: Decorations.secondaryCardDecoration(),
          child: FractionallySizedBox(
            heightFactor: 0.95,
            widthFactor: 0.95,
            child: controller.canShowData.value ? _data() : const SizedBox(),
          ),
        ),
      );

  Widget _data() => const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(flex: 3, child: PrescriptionInfo()),
                Expanded(flex: 5, child: PatientInfo()),
              ],
            ),
          ),
          Expanded(child: PersonalInfo()),
        ],
      );
}
