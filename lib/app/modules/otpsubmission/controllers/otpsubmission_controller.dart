import 'dart:async';

import 'package:get/get.dart';

class OtpsubmissionController extends GetxController {


  RxInt timeLeft = 0.obs;
  late Timer timer;
  RxString timerText = "".obs;
  RxBool isResendActive = true.obs;
  RxString phoneNumber = "".obs;


  @override
  void onInit() {
    super.onInit();
    startTimer();
    phoneNumber.value = Get.arguments[0];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    if(timer != null){
      timer.cancel();
    }
  }

  startTimer(){
    timeLeft.value = 20;
    isResendActive.value = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timeLeft.value--;

      int min = (timeLeft.value/60).floor();
      int sec = ((timeLeft.value % 60));

      if(timeLeft.value == 0){
        timerText.value = "Resend";
        isResendActive.value = true;
        timer.cancel();
      }else {
        timerText.value = "0$min:${sec.toString().length == 1 ? "0$sec" : sec}";
      }
    });

  }

}
