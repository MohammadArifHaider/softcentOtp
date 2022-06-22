import 'package:get/get.dart';

import '../controllers/otpsubmission_controller.dart';

class OtpsubmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpsubmissionController>(
      () => OtpsubmissionController(),
    );
  }
}
