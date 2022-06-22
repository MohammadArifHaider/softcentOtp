import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:softcentotp/app/data/color.dart';
import 'package:softcentotp/app/data/strings.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
              () {
            return AnimatedPadding(
              duration: Duration(seconds: 3),
              padding: EdgeInsets.fromLTRB(
                  98, 0, 98, controller.margin.value.toDouble()),
              child: Container(
                height: 52,
                width: 230,
                child:  Text(
                  headText,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: green
                  ),
                ),
              ),
            );
          },
        ),)
      ,
    );
  }
}
