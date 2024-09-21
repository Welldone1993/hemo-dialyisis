import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/01-home/common/home_page_binding.dart';
import '../../pages/01-home/view/home_page_view.dart';
import '../../pages/02-volume_page/common/volume_page_binding.dart';
import '../../pages/02-volume_page/view/volume_page_view.dart';
import '../../pages/03-font_page/common/font_page_binding.dart';
import '../../pages/03-font_page/view/font_page_view.dart';
import '../../pages/04-vascular_access_page/common/vascular_access_page_binding.dart';
import '../../pages/04-vascular_access_page/view/vascular_access_page_view.dart';
import '../../pages/05-consumables_page/common/consumables_page_binding.dart';
import '../../pages/05-consumables_page/view/consumable_page_view.dart';
import '../../pages/06-weighing_page/common/weighing_page_binding.dart';
import '../../pages/06-weighing_page/view/weighing_page_view.dart';
import '../../pages/07-installing_page/common/installing_page_binding.dart';
import '../../pages/07-installing_page/view/installing_page_view.dart';
import '../../pages/08-preparation_page/common/preparation_page_binding.dart';
import '../../pages/08-preparation_page/view/preparation_page_view.dart';
import '../../pages/09-physical_preparation_page/common/physical_preparation_page_binding.dart';
import '../../pages/09-physical_preparation_page/view/physical_preparation_page_view.dart';
import '../../pages/10-start_process/common/start_process_page_binding.dart';
import '../../pages/10-start_process/view/start_process_page_view.dart';
import '../../pages/11-treatment_page/common/treatment_page_binding.dart';
import '../../pages/11-treatment_page/view/treatment_page_view.dart';
import '../../pages/12-blood_return_page/common/blood_return_binding.dart';
import '../../pages/12-blood_return_page/view/blood_return_page_view.dart';
import '../../pages/education_page/common/education_page_binding.dart';
import '../../pages/education_page/view/education_page_view.dart';
import '../../pages/profile_page/common/profile_page_binding.dart';
import '../../pages/profile_page/view/profile_page_view.dart';
import '../../pages/store_page/common/store_page_binding.dart';
import '../../pages/store_page/view/store_page_view.dart';
import 'route_names.dart';

class HemoDialysisModulePages {
  static final List<GetPage<dynamic>> routes = [
    _homePage(),
    _storePage(),
  ];

  static GetPage<dynamic> _homePage() => GetPage(
        name: HemoDialysisRouteNames.homePage.path,
        page: HomePageView.new,
        binding: HomePageBinding(),
        children: [
          _volumePage(),
          _profilePage(),
          _educationPage(),
        ],
      );

  static GetPage<dynamic> _storePage() => GetPage(
        name: HemoDialysisRouteNames.storePage.path,
        page: StorePageView.new,
        binding: StorePageBinding(),
      );

  static GetPage<dynamic> _profilePage() => GetPage(
        name: HemoDialysisRouteNames.profilePage.path,
        page: ProfilePageView.new,
        binding: ProfilePageBinding(),
        customTransition: MyCustomTransition(),
        transitionDuration: const Duration(milliseconds: 200),
      );

  static GetPage<dynamic> _educationPage() => GetPage(
        name: HemoDialysisRouteNames.educationPage.path,
        page: EducationPageView.new,
        binding: EducationPageBinding(),
        customTransition: MyCustomTransition(),
        transitionDuration: const Duration(milliseconds: 200),
      );

  static GetPage<dynamic> _volumePage() => GetPage(
        name: HemoDialysisRouteNames.volumePage.path,
        page: VolumePageView.new,
        binding: VolumePageBinding(),
        children: [_fontPage()],
      );

  static GetPage<dynamic> _fontPage() => GetPage(
        name: HemoDialysisRouteNames.fontPage.path,
        page: FontPageView.new,
        binding: FontPageBinding(),
        children: [_vascularAccessPage()],
      );

  static GetPage<dynamic> _vascularAccessPage() => GetPage(
        name: HemoDialysisRouteNames.vascularAccessPage.path,
        page: VascularAccessPageView.new,
        binding: VascularAccessPageBinding(),
        children: [_consumablesPage()],
      );

  static GetPage<dynamic> _consumablesPage() => GetPage(
      name: HemoDialysisRouteNames.consumablesPage.path,
      page: ConsumablesPageView.new,
      binding: ConsumablesPageBinding(),
      children: [_weighingPage()]);

  static GetPage<dynamic> _weighingPage() => GetPage(
      name: HemoDialysisRouteNames.weighingPage.path,
      page: WeighingPageView.new,
      binding: WeighingPageBinding(),
      children: [_installingPage()]);

  static GetPage<dynamic> _installingPage() => GetPage(
      name: HemoDialysisRouteNames.installingPage.path,
      page: InstallingPageView.new,
      binding: InstallingPageBinding(),
      children: [_preparationPage()]);

  static GetPage<dynamic> _preparationPage() => GetPage(
      name: HemoDialysisRouteNames.preparationPage.path,
      page: PreparationPageView.new,
      binding: PreparationPageBinding(),
      children: [_physicalPreparationPage()]);

  static GetPage<dynamic> _physicalPreparationPage() => GetPage(
      name: HemoDialysisRouteNames.physicalPreparationPage.path,
      page: PhysicalPreparationPageView.new,
      binding: PhysicalPreparationPageBinding(),
      children: [_startProcessPage()]);

  static GetPage<dynamic> _startProcessPage() => GetPage(
      name: HemoDialysisRouteNames.startProcessPage.path,
      page: StartProcessPageView.new,
      binding: StartProcessPageBinding(),
      children: [_treatmentPage()]);

  static GetPage<dynamic> _treatmentPage() => GetPage(
      name: HemoDialysisRouteNames.treatmentPage.path,
      page: TreatmentPageView.new,
      binding: TreatmentPageBinding(),
      children: [_bloodReturnPage()]);

  static GetPage<dynamic> _bloodReturnPage() => GetPage(
        name: HemoDialysisRouteNames.bloodReturnPage.path,
        page: BloodReturnPageView.new,
        binding: BloodReturnPageBinding(),
      );
}

class MyCustomTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;

    var tween = Tween(
      begin: begin,
      end: end,
    );
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
