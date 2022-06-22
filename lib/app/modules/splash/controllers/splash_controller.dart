import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  RxInt margin = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Timer(Duration(seconds: 1), () {
      while(margin.value<=620)
        margin.value+= 50;
    });

    Timer(Duration(seconds: 3), () {
      gotoLoginPage();
    });
  }

  @override
  void onClose() {}

  gotoLoginPage() {
    Get.offAllNamed(Routes.LOGIN_WITH_PHONE);
  }
}
