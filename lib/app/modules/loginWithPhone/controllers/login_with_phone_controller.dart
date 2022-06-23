import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginWithPhoneController extends GetxController {

  var agree = false.obs;

  RxString phoneNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  gotoOTPpage(){
    Get.toNamed(Routes.OTPSUBMISSION, arguments: [phoneNumber.value]);
  }

}
