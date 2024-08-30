import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/image_provider.dart';
import '../../../components/scaffold.dart';
import '../../../components/text_button.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(context),
        showEndDrawer: true,
        hasFloatingActionButton: true,
        action1: _appBarAvatar(),
        action2: _appBarWelcomeText(),
        action3: const AppBarSupportIcon(),
      );

  Widget _appBarWelcomeText() => const AutoSizeText(
        'محمد عزیز، خوش آمدید.',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontFamily: Constants.iranSansFont,
        ),
      );

  Widget _appBarAvatar() => const FractionallySizedBox(
        heightFactor: 0.4,
        child: CustomImageProvider(
          imageAddress: Constants.avatarImage,
        ),
      );

  Widget _body(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: _profileCard()),
            const Spacer(),
            Expanded(flex: 6, child: _startProcessCard(context)),
          ],
        ),
      );

  Widget _profileCard() => FractionallySizedBox(
        heightFactor: 1,
        child: DecoratedBox(
          decoration: _profileDecoration(),
          child: FractionallySizedBox(
            heightFactor: 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 2, child: _profileCardAvatar()),
                Expanded(flex: 3, child: _profileCardMenu()),
                _profileCardFooter(),
              ],
            ),
          ),
        ),
      );

  Widget _profileCardAvatar() => const Padding(
        padding: EdgeInsets.only(
          left: Constants.mediumSpace,
          right: Constants.mediumSpace,
          top: Constants.mediumSpace,
        ),
        child: CustomImageProvider(
          imageAddress: Constants.avatarImage,
        ),
      );

  Widget _profileCardMenu() => SingleChildScrollView(
        child: Column(
          children: [
            CustomTextButton(action: () {}, text: 'پروفایل کاربری'),
            _profileCardDivider(),
            CustomTextButton(action: () {}, text: 'نسخه'),
            _profileCardDivider(),
            CustomTextButton(action: () {}, text: 'فروشگاه'),
            _profileCardDivider(),
            CustomTextButton(action: () {}, text: 'آموزش'),
            _profileCardDivider(),
            // const Spacer(),
          ],
        ),
      );

  Widget _profileCardFooter() => FractionallySizedBox(
        widthFactor: 0.8,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _profileFooterButton(
                onPressed: () {
                  //   TODO: poshtiban
                },
                icon: FontAwesomeIcons.headset,
              ),
              _profileFooterButton(
                onPressed: () {
                  //   TODO: ????
                },
                icon: FontAwesomeIcons.userGear,
              ),
              _profileFooterButton(
                onPressed: () {
                  //   TODO: poshtibani
                },
                icon: CupertinoIcons.question_square,
              ),
              _profileFooterButton(
                onPressed: () {
                  //   TODO: setting page
                },
                icon: CupertinoIcons.gear,
              )
            ],
          ),
        ),
      );

  Widget _profileFooterButton({
    required final void Function()? onPressed,
    required final IconData icon,
  }) =>
      Expanded(
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Constants.whiteColor,
          ),
        ),
      );

  Widget _profileCardDivider() => const Padding(
        padding: EdgeInsets.symmetric(
          vertical: Constants.tinySpace,
        ),
        child: FractionallySizedBox(
          widthFactor: 0.35,
          child: Divider(),
        ),
      );

  BoxDecoration _profileDecoration() => const BoxDecoration(
        color: Constants.cardBorderColor,
        borderRadius: BorderRadius.all(Radius.circular(Constants.xxLargeSpace)),
      );

  Widget _startProcessCard(final BuildContext context) => FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.4,
        child: DecoratedBox(
          decoration: Decorations.cardDecoration(),
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _startIconAndTexts(context)),
                Expanded(child: _startAndSupportButtons()),
              ],
            ),
          ),
        ),
      );

  Widget _startIconAndTexts(final BuildContext context) => Row(
        children: [
          Expanded(child: _texts()),
          Constants.largeHorizontalSpacer,
          const CustomImageProvider(imageAddress: Constants.startImage),
        ],
      );

  Widget _texts() => const FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'شروع درمان',
              style: Constants.disableTextStyle,
            ),
            AutoSizeText(
              'برای درمان آماده اید؟',
              style: Constants.defaultTextStyle,
            ),
          ],
        ),
      );

  Widget _startAndSupportButtons() => FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.9,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomButtonWithText(
                label: 'بله',
                action: controller.navigateToVolumePage,
              ),
            ),
            Constants.giantHorizontalSpacer,
            Expanded(
              child: CustomButtonWithText.secondary(
                label: 'خیر به پشتیبانی نیاز دارم',
                action: () {},
              ),
            )
          ],
        ),
      );
}
