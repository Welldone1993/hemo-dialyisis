import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/profile_page_controller.dart';
import '../model/enum/profile_header_button_enum.dart';
import 'widget/info.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(context),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body(BuildContext context) => Obx(
        () => DecoratedBox(
          decoration: Decorations.creamyCardDecoration(),
          child: Column(
            children: [
              _header(context),
              controller.canShowData.value
                  ? Expanded(
                      child: Padding(
                        padding: Constants.giantPadding,
                        child: _data(),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      );

  Widget _data() => switch (controller.selectedHeader.value) {
        ProfileHeaderButtonEnum.info => const PatientInfo(),
        ProfileHeaderButtonEnum.prescription =>
          Text(ProfileHeaderButtonEnum.prescription.title),
        ProfileHeaderButtonEnum.treatmentCalendar =>
          Text(ProfileHeaderButtonEnum.treatmentCalendar.title),
        ProfileHeaderButtonEnum.reports =>
          Text(ProfileHeaderButtonEnum.reports.title),
        ProfileHeaderButtonEnum.medicalRecords =>
          Text(ProfileHeaderButtonEnum.medicalRecords.title),
      };

  Widget _header(BuildContext context) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _profileHeaderButton(
                  header: ProfileHeaderButtonEnum.medicalRecords,
                ),
                Constants.mediumHorizontalSpacer,
                _profileHeaderButton(
                  header: ProfileHeaderButtonEnum.reports,
                ),
                Constants.mediumHorizontalSpacer,
                _profileHeaderButton(
                  header: ProfileHeaderButtonEnum.treatmentCalendar,
                ),
                Constants.mediumHorizontalSpacer,
                _profileHeaderButton(
                  header: ProfileHeaderButtonEnum.prescription,
                ),
                Constants.mediumHorizontalSpacer,
                _profileHeaderButton(
                  header: ProfileHeaderButtonEnum.info,
                ),
              ],
            ),
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
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.giantSpace,
              vertical: Constants.largeSpace,
            ),
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
}
