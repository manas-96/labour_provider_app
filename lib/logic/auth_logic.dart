



import 'package:employ_provider/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLogic extends GetxController{

  RxBool loader = false.obs;

  logIn(String email, String pass, String platformVersion)async{
    if(email=="") {
      Get.snackbar("Validation error", "Please enter your email",colorText: Colors.red);
      return;
    }
    if(pass==""){
      Get.snackbar("Validation error", "Please enter your password",colorText: Colors.red);
      return;
    }
    final body={
      "email": email,
      "password": pass,
      "device_name": platformVersion,
    };
    loader.value=true;
    final result = await ApiResponse().postFunction(body,"login");
    loader.value=false;
    if(result=="success"){

    }
    else{
      Get.snackbar("Failed to sign in", "Please enter a valid credential",colorText: Colors.red);
    }
  }
  forgotPassword(String email)async{
    if(email=="") {
      Get.snackbar("Validation error", "Please enter your email",colorText: Colors.red);
      return;
    }
    final body={
      "email": email,
    };
    loader.value=true;
    final result = await ApiResponse().postFunction(body,"forgot_password");
    loader.value=false;
    if(result=="success"){

    }
    else{
      Get.snackbar("Validation error", "Please enter a valid email",colorText: Colors.red);
    }
  }

}