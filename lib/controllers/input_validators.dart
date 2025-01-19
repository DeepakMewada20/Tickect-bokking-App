import 'package:get/get.dart';

class InputValidators {
  bool validateFiled(String tital, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar("Error", "$tital is empty");
    return false;
  }
}
