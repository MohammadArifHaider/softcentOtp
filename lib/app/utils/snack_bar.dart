import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarWidget {

  static bool isActive = false;

  static showMessage(String msg) async{
    if(SnackBarWidget.isActive == false) {
      SnackBarWidget.isActive = true;
      Get.rawSnackbar(
          message: msg,
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.TOP,
          borderRadius: 8,
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          duration: Duration(seconds: 2)
      );
      Future.delayed(Duration(seconds: 3)).then((value) {
        SnackBarWidget.isActive = false;
      });
    }
  }

}