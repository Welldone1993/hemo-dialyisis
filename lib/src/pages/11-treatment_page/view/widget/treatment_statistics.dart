import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button_with_icon.dart';
import '../../../../components/image_provider.dart';
import '../../../../infrastructure/app_controller/app_controller.dart';
import '../../../../infrastructure/utils/constants.dart';
import '../../../../infrastructure/utils/decorations.dart';
import '../../controller/treatment_controller.dart';

class TreatmentStatistic extends GetView<TreatmentPageController> {
  const TreatmentStatistic({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: Decorations.cardDecoration(),
        child: Row(
          children: [
            Expanded(child: _pauseButton(context)),
            Expanded(
              flex: 3,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(Constants.giantSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          'علائم حیاتی',
                          style: TextStyle(
                            fontFamily: Constants.iranSansFont,
                            color: Constants.disableColor,
                            fontWeight: FontWeight.w500,
                            fontSize:
                                AppController().setting.value!.titleFontSize,
                          ),
                        ),
                      ),
                      Expanded(
                        child: _indicators(
                          context,
                          title: 'فشار شریانی',
                          value: 155,
                        ),
                      ),
                      Expanded(
                        child: _indicators(
                          context,
                          title: 'فشار وریدی',
                          value: 120,
                          isVenousPressure: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _indicators(
    final BuildContext context, {
    required final String title,
    required final int value,
    final bool? isVenousPressure,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: AutoSizeText(
                    '${value.toString()}  میلی متر جیوه ',
                    style: TextStyle(
                      fontFamily: Constants.iranSansFaNumFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isVenousPressure ?? false
                          ? const Color(0xff86D6D0)
                          : const Color(0xff779285),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Expanded(
                    child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: CustomSliderThumb(
                      isVenousPressure: isVenousPressure ?? false,
                    ),
                    trackShape: GradientTrackShape(
                      isVenousPressure: isVenousPressure ?? false,
                    ),
                    trackHeight: 10,
                  ),
                  child: Slider(
                    value: value.toDouble() / 1000,
                    onChanged: (value) {},
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AutoSizeText(
                title,
                style: const TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      );

  Padding _pauseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.giantSpace),
      child: CustomButtonWithIcon(
        action: () {},
        color: Constants.cardBackground,
        height: MediaQuery.of(context).size.height / 4,
        width: 100,
        child: const FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child:
                      CustomImageProvider(imageAddress: Constants.pauseImage)),
              AutoSizeText(
                'وقفه در درمان',
                style: TextStyle(
                  fontFamily: Constants.iranSansFont,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumb extends SliderComponentShape {
  final bool isVenousPressure;

  CustomSliderThumb({required this.isVenousPressure});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(30.0, 20.0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: 15.0,
      height: 25.0,
    );
    final RRect thumbRRect =
        RRect.fromRectAndRadius(thumbRect, const Radius.elliptical(5, 5));

    final Paint paint = Paint()
      ..color =
          isVenousPressure ? const Color(0xff86D6D0) : const Color(0xff779285)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(thumbRRect, paint);
  }
}

class GradientTrackShape extends RoundedRectSliderTrackShape {
  final bool isVenousPressure;

  GradientTrackShape({
    required this.isVenousPressure,
  });

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    double additionalActiveTrackHeight = 0,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    required RenderBox parentBox,
    Offset? secondaryOffset,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required Offset thumbCenter,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          if (isVenousPressure) const Color(0xffffffff),
          const Color(0xff09B2A4),
          const Color(0xffFF6A5E),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(trackRect);

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, const Radius.circular(5.0)),
      paint,
    );
  }
}
