import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie_ticket/pages/home_screen.dart';
import 'package:my_movie_ticket/pages/login_screen.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class AuthController extends GetxController {
  static AuthController instence = Get.find();
  late Rx<User?> _user;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(
      const Duration(seconds: 2),
      () {
        if (user == null) {
          Get.offAll(const LoginScreen());
        } else {
          Get.offAll(const HomeScreen());
        }
      },
    );
  }

  void registorUser(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackeBar("Acount creation fail", e);
    }
  }

  getErrorSnackeBar(String massage, _) {
    Get.snackbar(
      "Error",
      "$massage\n ${_.massage}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.redBorder,
      borderRadius: 10,
      colorText: Colors.white,
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 10,
        right: 10,
      ),
    );
  }
}
