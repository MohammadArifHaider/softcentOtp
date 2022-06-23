import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:softcentotp/app/utils/snack_bar.dart';

import '../../../data/color.dart';
import '../../../data/strings.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_with_phone_controller.dart';

class LoginWithPhoneView extends GetView<LoginWithPhoneController> {
  const LoginWithPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //back button
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black12.withOpacity(0.1)),
                    ),
                    margin: const EdgeInsets.only(left: 24, right: 303, top: 53),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                    ),
                  ),

                  //Header
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Text(
                        headText,
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                            color: green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24, bottom: 15.0),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: blackgrey),
                        ),
                      ),
                    ],
                  ),

                  //Box
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 24),
                          height: 46,
                          width: 97,
                          decoration: BoxDecoration(
                              color: textBackground,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("+880", style: TextStyle(
                                  color: blackgrey,
                                  fontSize: 14
                              ),),
                              const SizedBox(width: 10,),
                              Icon(Icons.keyboard_arrow_down_sharp, color: blackgrey,size: 18,)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 12, right: 30),
                            padding: const EdgeInsets.only(left: 12, right: 30),
                            decoration: BoxDecoration(
                                color: textBackground,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              //controller: controller.emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '1815378942',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              onChanged: (value){
                                  controller.phoneNumber.value = value;
                              },
                              validator: (value){
                                if(value?.length != 10){
                                  return "Please enter 10 digit number";
                                }
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 43,
                  ),


                  //checkBox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.agree.value = !controller.agree.value;
                        },
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: controller.agree.isFalse?Colors.white:green,
                            border: Border.all(
                                color: Colors.black12.withOpacity(0.1)),
                          ),
                          //margin: const EdgeInsets.only(left: 24, right: 303, top: 53),
                          child: controller.agree.isTrue ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 8,
                          ) : Container(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(text:  TextSpan(
                          children: [
                             TextSpan(
                              text: "You agree to our ",
                               style: TextStyle(
                                 fontSize: 14,
                                 color: blackgrey
                               )
                            ),
                            TextSpan(
                              text: "terms and conditions",
                               style: TextStyle(
                                 fontSize: 14,
                                 color: green
                               )
                            ),

                          ]
                        )),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  //Continue button
                  GestureDetector(
                    onTap: () {
                      if(controller.phoneNumber.value.length == 10) {
                        if(controller.agree.isTrue) {
                          controller.gotoOTPpage();
                        }else{
                          SnackBarWidget.showMessage("Please accept terms and conditions");
                        }
                      }
                    },
                    child: Container(
                      height: 46,
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(28)),
                      child: const Center(
                          child: Text(
                            "Continue",
                            style:
                            TextStyle(fontSize: 17,color: Colors.white),
                          )),
                    ),
                  ),

                  SizedBox(height: 25,),

                  //Signup
                  Container(
                    alignment: Alignment.center,
                    child: RichText(text:  TextSpan(
                        children: [
                          TextSpan(
                              text: "Dont have an account? ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: blackgrey
                              )
                          ),
                          TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: green
                              )
                          ),

                        ]
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
