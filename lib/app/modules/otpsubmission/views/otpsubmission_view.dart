import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:softcentotp/app/data/color.dart';

import '../controllers/otpsubmission_controller.dart';

class OtpsubmissionView extends GetView<OtpsubmissionController> {
  const OtpsubmissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //back button
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border:
                            Border.all(color: Colors.black12.withOpacity(0.1)),
                      ),
                      margin:
                          const EdgeInsets.only(left: 24, right: 303, top: 53),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                  ),

                  Image.asset(
                    "assets/images/otp.jpeg",
                    height: 298,
                    width: 298,
                  ),

                  Text(
                    "Verification Code",
                    style: TextStyle(
                        fontSize: 32,
                        color: textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Please type the code we sent to",
                    style: TextStyle(
                        fontSize: 16,
                        color: blackgrey,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "+880"+controller.phoneNumber.value,
                    style: TextStyle(
                        fontSize: 16,
                        color: blackgrey,
                        fontWeight: FontWeight.w400),
                  ),

                  //PinView
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(top: 30),
                    child: PinCodeTextField(
                      length: 5,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.phone,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 54,
                        fieldWidth: 50,
                        activeColor: textBackground,
                        activeFillColor: textBackground,
                        inactiveColor: textBackground,
                        inactiveFillColor: textBackground,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                      appContext: Get.context!,
                    ),
                  ),

                  //Resend
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Code Sent. Try Again in  ",
                          style: TextStyle(fontSize: 14, color: blackgrey)),
                      TextSpan(
                          text: controller.timerText.value,
                          style: TextStyle(fontSize: 14, color: green),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                            if(controller.isResendActive.isTrue){
                              controller.startTimer();
                            }
                            }),
                    ])),
                  ),

                  //Next button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 46,
                      margin:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(28)),
                      child: const Center(
                          child: Text(
                        "Next",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
