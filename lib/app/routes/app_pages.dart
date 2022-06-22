import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginWithPhone/bindings/login_with_phone_binding.dart';
import '../modules/loginWithPhone/views/login_with_phone_view.dart';
import '../modules/otpsubmission/bindings/otpsubmission_binding.dart';
import '../modules/otpsubmission/views/otpsubmission_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_WITH_PHONE,
      page: () => const LoginWithPhoneView(),
      binding: LoginWithPhoneBinding(),
    ),
    GetPage(
      name: _Paths.OTPSUBMISSION,
      page: () => const OtpsubmissionView(),
      binding: OtpsubmissionBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
