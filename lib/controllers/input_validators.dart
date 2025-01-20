import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputValidators {
  static bool validateFiled(String tital, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar(
      "Error",
      "$tital is empty",
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }

  static bool validatePassword(String value1, String value2) {
    if (value1.trim()==value2.trim()) {
      return true;
    }
    Get.snackbar(
      "Error",
      "Conferm password do not match",
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }
}
