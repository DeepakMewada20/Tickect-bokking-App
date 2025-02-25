import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isEdit = false.obs;

  toggleEdit() {
    isEdit.toggle();
  }
}
