import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/scaffold.dart';
import '../../../components/text_button.dart';
import '../controller/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        pageTitle: 'خانه',
      );

  Widget _body() => Column(
        children: [
          const Placeholder(),
          CustomTextButton(
            action: () {
              print('!!!!');
            },
            label: 'بعدی',
          ),
        ],
      );
}
