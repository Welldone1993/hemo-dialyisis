import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/components/image_provider.dart';
import 'package:hemo_dialysis/src/components/text_button.dart';
import 'package:hemo_dialysis/src/infrastructure/utils/constants.dart';
import 'package:hemo_dialysis/src/infrastructure/utils/decorations.dart';

import '../../../components/scaffold.dart';
import '../controller/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(context),
        showEndDrawer: true,
        hasFloatingActionButton: true,
      );

  Widget _body(final BuildContext context) => FittedBox(
        child: Row(
          children: [
            _startProcessCard(context),
          ],
        ),
      );

  Widget _startProcessCard(final BuildContext context) {
    return DecoratedBox(
      decoration: Decorations.cardDecoration(),
      child: SizedBox(
        width: 719,
        height: 372,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 35,
              vertical: MediaQuery.of(context).size.height / 35,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _startIconAndTexts(context),
                Constants.giantVerticalSpacer,
                _startAndSupportButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _startIconAndTexts(final BuildContext context) => const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('شروع درمان'),
              Constants.mediumVerticalSpacer,
              Text('برای درمان آماده اید؟'),
            ],
          ),
          Constants.giantHorizontalSpacer,
          Constants.giantHorizontalSpacer,
          CustomImageProvider(
            imageAddress: Constants.startImage,
          ),
        ],
      );

  Widget _startAndSupportButtons() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextButton(
            label: 'بله',
            action: () {},
          ),
          Constants.giantHorizontalSpacer,
          CustomTextButton.secondary(
            label: 'خیر به پشتیبانی نیاز دارم',
            action: () {},
          )
        ],
      );
}
