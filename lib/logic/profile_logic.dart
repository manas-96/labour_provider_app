


import 'package:employ_provider/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLogic extends GetxController{
  RxBool loader = false.obs;
  changePassword(String oldPass, String pass, String confirmPass)async{
    if(oldPass=="") {
      Get.snackbar("Validation error", "Please enter your Older password",colorText: Colors.red);
      return;
    }
    if(pass!=confirmPass){
      Get.snackbar("Validation error", "Password & confirm password should be same",colorText: Colors.red);
      return;
    }
    final body={
      "old_password": oldPass,
      "password": pass,
      "confirm_password": confirmPass,
    };
    loader.value=true;
    final result = await ApiResponse().postFunction(body,"change-password");
    loader.value=false;
    if(result=="success"){
      Get.snackbar("", "Password changed successfully",colorText: Colors.green);
    }
    else{
      Get.snackbar("Failed", "Current password doesn't match",colorText: Colors.red);
    }
  }
  getProfile()async{
    final result = await ApiResponse().getFunction("profile");

  }
}