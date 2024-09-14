import 'dart:async';

import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class TreatmentPageController extends GetxController {
  Timer? timer;

  final RxBool isTreatmentDone = false.obs;

  final RxString remainingSecond = '00'.obs,
      remainingMinute = '30'.obs,
      remainingHour = '04'.obs;

  final RxInt secondsLeft = 3.obs, initialSeconds = 0.obs;
  final RxDouble remainingTime = 1.0.obs;

  // final RxInt secondsLeft = (16200).obs;

  @override
  void onInit() {
    initialSeconds.value = secondsLeft.value;
    _timer();
    super.onInit();
  }

  void _timer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (secondsLeft.value > 0) {
          secondsLeft.value -= 1;
          remainingTime.value = secondsLeft.value / initialSeconds.value;
          _formatTime(secondsLeft.value);
        } else {
          timer.cancel();
          // isTreatmentDone.value = true;
        }
      },
    );
  }

  void _formatTime(final int seconds) {
    int hour = (seconds ~/ 3600);
    int minute = _minuteExtractor(hour: hour, seconds: seconds);
    remainingHour.value = _getTimeWithZero(hour);
    remainingMinute.value = _getTimeWithZero(minute);
    int second = seconds % 60;
    remainingSecond.value = _getTimeWithZero(second);
  }

  int _minuteExtractor({
    required final int hour,
    required final int seconds,
  }) =>
      (hour == 0) ? seconds ~/ 60 : (seconds - (hour * 3600)) ~/ 60;

  String _getTimeWithZero(final int minute) {
    if (minute == 0) {
      return '00';
    } else if (minute < 10) {
      return '0$minute';
    } else {
      return minute.toString();
    }
  }

  void navigateToBloodReturnPage() =>
      Get.toNamed(HemoDialysisRouteNames.bloodReturnPage.uri);
}
