import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hemo_dialysis/src/components/image_provider.dart';

import '../../../../infrastructure/utils/constants.dart';
import '../../controller/store_page_controller.dart';
import '../../model/store_item_view_model.dart';

class StoreItem extends GetView<StorePageController> {
  const StoreItem({
    required this.item,
    super.key,
  });

  final StoreItemViewModel item;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Constants.mediumSpace),
        child: DecoratedBox(
          decoration: _itemDecoration(),
          child: Column(
            children: [
              Expanded(flex: 2, child: _header()),
              Expanded(child: _footer()),
            ],
          ),
        ),
      );

  Widget _header() => AspectRatio(
        aspectRatio: 1,
        child: DecoratedBox(
          decoration: _headerDecoration(),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomImageProvider(
                        imageAddress: item.image,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.mediumSpace,
                              vertical: Constants.smallSpace,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: _rate()),
                                Expanded(child: _rateCount()),
                              ],
                            ),
                          ),
                        ),
                        Expanded(flex: 3, child: _discountAndDelivery()),
                      ],
                    )),
                  ],
                ),
              ),
              Expanded(child: _nameAndPrice())
            ],
          ),
        ),
      );

  Widget _nameAndPrice() => FractionallySizedBox(
        widthFactor: 0.95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText(
              'تومان',
              style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  color: Constants.whiteColor,
                  fontWeight: FontWeight.w300),
            ),
            Constants.smallHorizontalSpacer,
            Expanded(
              child: AutoSizeText(
                item.price,
                style: const TextStyle(
                  fontFamily: Constants.iranSansFaNumFont,
                  color: Constants.whiteColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            AutoSizeText(
              item.title,
              style: const TextStyle(
                fontFamily: Constants.iranSansFont,
                color: Constants.whiteColor,
                fontSize: 12
              ),
               overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

  Widget _discountAndDelivery() => FractionallySizedBox(
        heightFactor: 0.7,
        widthFactor: 0.5,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Constants.cardBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constants.xxLargeSpace),
              ),
              border: Border.all(color: Constants.cardBorderColor)),
          child: Column(
            children: [
              const Expanded(
                child: Icon(Icons.shopping_cart_outlined),
              ),
              if (item.hasDelivery)
                const Expanded(
                  child: Icon(
                    CupertinoIcons.cube_box,
                  ),
                ),
              if (item.hasDiscount)
                const Expanded(
                  child: Icon(
                    Icons.discount_outlined,
                    color: Constants.buttonColor,
                  ),
                ),
            ],
          ),
        ),
      );

  Widget _rateCount() => AutoSizeText(
        '(${item.rateCount})',
        style: const TextStyle(
            fontFamily: Constants.iranSansFaNumFont,
            fontWeight: FontWeight.w500,
            color: Constants.disableColor,
            fontSize: 12),
      );

  Widget _rate() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Constants.starColor,
              size: 15,
            ),
          ),
          Expanded(
            child: AutoSizeText(
              item.rate.toString(),
              style: const TextStyle(
                fontFamily: Constants.iranSansFaNumFont,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );

  BoxDecoration _headerDecoration() => const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            Constants.storeItemBackgroundImage,
          ),
        ),
      );

  BoxDecoration _itemDecoration() => const BoxDecoration(
        color: Constants.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(Constants.xxLargeSpace),
        ),
      );

  Widget _footer() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _companyInfo(),
          Constants.smallVerticalSpacer,
          _volumeInfo(),
          const Spacer(),
          _addToCardButton(),
          const Spacer(),
        ],
      );

  Widget _volumeInfo() => FractionallySizedBox(
        widthFactor: 0.9,
        child: AutoSizeText(
          item.volume ?? '',
          style: const TextStyle(
            fontFamily: Constants.iranSansFont,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget _companyInfo() => FractionallySizedBox(
        widthFactor: 0.9,
        child: AutoSizeText(
          item.company,
          style: const TextStyle(
            fontFamily: Constants.iranSansFont,
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget _addToCardButton() => FractionallySizedBox(
        widthFactor: 0.5,
        child: GestureDetector(
          onTap: () {
            //   TODO: add to Card
          },
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Constants.buttonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Constants.mediumSpace + Constants.smallSpace,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.add_shopping_cart_sharp,
                      size: 20,
                      color: Constants.whiteColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'خرید',
                      style: TextStyle(
                          fontFamily: Constants.iranSansFont,
                          color: Constants.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
