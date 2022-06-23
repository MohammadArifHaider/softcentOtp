import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpsubmissionController extends GetxController {


  RxInt timeLeft = 0.obs;
  late Timer timer;
  RxString timerText = "".obs;
  RxBool isResendActive = true.obs;
  RxString phoneNumber = "".obs;
  RxString otp = "".obs;


  @override
   onInit()  {
    super.onInit();
    startTimer();
    phoneNumber.value = Get.arguments[0];

  }

  @override
  void onReady() async {
    super.onReady();
    otp.value = await getOtp(phoneNumber.value);
  }

  @override
  void onClose() {
    super.onClose();
    if(timer != null){
      timer.cancel();
    }
  }

  startTimer(){
    timeLeft.value = 80;
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

  Future<String> getOtp(val) async {
      final response = await http
          .get(Uri.parse('https://mocki.io/v1/9a3d57b9-fa3f-402e-99f9-982134108d18'));

      if (response.statusCode == 200) {
        final result = (jsonDecode(response.body));
        return result['otp_code'].toString();
      } else {
        throw Exception('Failed to load album');
      }
  }

}
