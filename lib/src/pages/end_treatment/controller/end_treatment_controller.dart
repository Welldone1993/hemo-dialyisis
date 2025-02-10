import 'dart:async';

import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';

class EndTreatmentController extends GetxController {
  Timer? timer;

  final RxString remainingTime = ''.obs;
  final RxInt secondsLeft = (3).obs;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void buttonAction() {
    Get.offAllNamed(HemoDialysisRouteNames.homePage.uri);
  }

  void _startTimer() {
    remainingTime.value = _formatTime(secondsLeft.value);

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (secondsLeft.value > 0) {
          secondsLeft.value -= 1;
          remainingTime.value = _formatTime(secondsLeft.value);
        } else {
          timer.cancel();
        }
      },
    );
  }

  String _formatTime(final int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${_getMinutes(minutes)}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String _getMinutes(final int minute) {
    if (minute == 0) {
      return '00';
    } else if (minute < 10) {
      return '0$minute';
    } else {
      return minute.toString();
    }
  }
}
