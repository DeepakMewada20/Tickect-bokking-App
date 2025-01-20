import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class InputValidators {
  static bool validateFiled(String tital, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    getErrorSnackBar2("$tital is Empty");
    return false;
  }

  static bool validatePassword(String value1, String value2) {
    if (value1.trim().isNotEmpty) {
      if (value2.trim().isNotEmpty) {
        if (value1.trim() == value2.trim()) {
          return true;
        } else {
          getErrorSnackBar2("Confurm password not matched");
          return false;
        }
      } else {
        getErrorSnackBar2("confurm password is Empty");
        return false;
      }
    } else {
      getErrorSnackBar2("Password is Empty");
      return false;
    }
  }

  static getErrorSnackBar2(String tital) {
    Get.snackbar(
      "Error",
      tital,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }
}
