import 'dart:async';

import 'package:get/get.dart';

class BloodReturnController extends GetxController {
  Timer? timer;

  final RxBool isReturningBlood = false.obs;

  final RxString actionButtonName = ''.obs, remainingTime = ''.obs;
  final RxInt secondsLeft = (3).obs;

  @override
  void onInit() {
    actionButtonName.value = 'بازگشت خون';
    super.onInit();
  }

  void buttonAction() {
    if (!isReturningBlood.value) {
      _startTimer();
    } else {
      isReturningBlood.value = false;
      actionButtonName.value = 'بازگشت خون';
      secondsLeft.value = 3;
    }
  }

  void _startTimer() {
    remainingTime.value = _formatTime(secondsLeft.value);
    isReturningBlood.value = true;
    actionButtonName.value = 'پایان درمان';

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
