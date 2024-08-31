import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/components/image_provider.dart';

import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../../../infrastructure/utils/decorations.dart';
import '../../shared/view/app_bar_back_icon.dart';
import '../../shared/view/app_bar_support_icon.dart';
import '../controller/store_page_controller.dart';
import 'widget/store_item.dart';

class StorePageView extends GetView<StorePageController> {
  const StorePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: _body(),
        action1: const AppBarBackIcon(),
        action2: const AppBarSupportIcon(),
      );

  Widget _body() => Row(
        children: [
          Expanded(child: _categoryList()),
          Expanded(
            flex: 3,
            child: FractionallySizedBox(
              widthFactor: 0.95,
              alignment: AlignmentDirectional.centerEnd,
              child: DecoratedBox(
                decoration: Decorations.creamyCardDecoration(),
                child: Column(
                  children: [
                    const Expanded(child: Placeholder()),
                    Expanded(
                      flex: 7,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => const StoreItem(),
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _categoryList() => SingleChildScrollView(
        child: Column(
          children: [
            _categoryItem(
              title: 'داروها',
              image: Constants.medicineImage,
            ),
            _categoryItem(
              title: 'موارد مصرفی',
              image: Constants.consumablesImage,
            ),
            _categoryItem(
                title: 'لوازم ضد عفونی',
                image: Constants.disinfectionSuppliesImage),
            _categoryItem(title: 'سایر', image: ''),
          ],
        ),
      );

  Widget _categoryItem({
    required final String title,
    required final String image,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Constants.largeSpace, horizontal: Constants.giantSpace),
        child: GestureDetector(
          onTap: () => ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: Text(
              '$title موجود نیست ',
              style: const TextStyle(
                fontFamily: Constants.iranSansFont,
                fontWeight: FontWeight.w500,
              ),
            ),
            duration: const Duration(milliseconds: 800),
            backgroundColor: Constants.buttonSecondaryColor,
          )),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Constants.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Constants.mediumSpace),
                topRight: Radius.circular(Constants.mediumSpace),
              ),
              boxShadow: [
                BoxShadow(
                  color: Constants.cardBorderColor,
                  blurStyle: BlurStyle.solid,
                  offset: Offset.fromDirection(1, 4),
                  spreadRadius: -2.5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    title,
                    style: const TextStyle(
                        color: Constants.categoryTitleColor,
                        fontFamily: Constants.iranSansFont
                        //     TODO: font b roya
                        ),
                  ),
                  CustomImageProvider(
                    imageAddress: image,
                    aspectRatio: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
