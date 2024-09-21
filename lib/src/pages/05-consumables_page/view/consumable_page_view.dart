import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/button_with_text.dart';
import '../../../components/chip.dart';
import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/consumable_page_controller.dart';
import '../model/consumable_model.dart';

class ConsumablesPageView extends GetView<ConsumablesPageController> {
  const ConsumablesPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body() => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: FractionallySizedBox(
                heightFactor: 0.9,
                widthFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: _consumableHintText()),
                          ..._consumablesPart(),
                        ],
                      ),
                    ),
                    Expanded(child: _actionButtons()),
                  ],
                ),
              ),
            ),
            Expanded(child: _storeHint()),
          ],
        ),
      );

  List<Widget> _consumablesPart() => [
        Expanded(
          child: _consumableRow(
            title: 'داروها',
            consumables: controller.medicines,
          ),
        ),
        Expanded(
          child: _consumableRow(
            title: 'مواد مصرفی',
            consumables: controller.consumables,
          ),
        ),
        Expanded(
          child: _consumableRow(
            title: 'لوازم ضدعفونی',
            consumables: controller.disinfectionSupplies,
          ),
        ),
        Expanded(
          child: _consumableRow(
            title: 'سایر',
            consumables: controller.other,
          ),
        ),
      ];

  Widget _consumableRow({
    required final String title,
    required final List<ConsumableModel> consumables,
  }) =>
      FractionallySizedBox(
        widthFactor: 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.end,
                runSpacing: 5,
                children: [
                  ...consumables.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.smallSpace),
                      child: CustomChip(
                        label: e.name,
                        action: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AutoSizeText(
              title,
              style: const TextStyle(
                fontFamily: Constants.iranSansFont,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget _consumableHintText() => const FractionallySizedBox(
        heightFactor: 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: AutoSizeText(
                'لیست مواد مصرفی',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  color: Constants.disableColor,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            Expanded(
              child: AutoSizeText(
                'مواردی که در خانه موجود دارید را از لیست زیر انتخاب کنید.',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      );

  Widget _actionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomButtonWithText(
              label: 'مرحله بعد',
              action: controller.navigateToWeighingPage,
            ),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          Expanded(
            child: CustomButtonWithText.outline(
              label: 'فروشگاه',
              action: controller.navigateToStorePage,
            ),
          ),
        ],
      );

  Widget _storeHint() => const FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Expanded(
              flex: 2,
              child: AutoSizeText(
                'اگر مواردی از لیست بالا را در خانه ندارید، میتوانید از طریق فروشگاه\nسفارش دهید و در سریعترین زمان ممکن درب خانه تحویل بگیرید.',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  color: Constants.disableColor,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            Constants.mediumHorizontalSpacer,
            Icon(
              CupertinoIcons.info,
              color: Constants.disableColor,
            ),
          ],
        ),
      );
}
