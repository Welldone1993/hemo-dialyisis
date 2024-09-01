import 'dart:async';

import 'package:get/get.dart';

class PreparationPageController extends GetxController {
  Timer? timer;
  final RxString buttonName = 'آماده سازی'.obs, remainingTime = ''.obs;
  final RxBool isPreparationMode = false.obs, isReady = false.obs;
  final RxInt secondsLeft = (3).obs;

  void actionOnButton() {
    if (!isPreparationMode.value && !isReady.value) {
      _timer();
    } else if (isReady.value) {
      print('READY!!!!!!!!');
    }
  }

  void _timer() {
    remainingTime.value = _formatTime(secondsLeft.value);
    isPreparationMode.value = true;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (secondsLeft.value > 0) {
          secondsLeft.value -= 1;
          remainingTime.value = _formatTime(secondsLeft.value);
        } else {
          timer.cancel();
          isPreparationMode.value = false;
          buttonName.value = 'مرحله بعد';
          isReady.value = true;
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
