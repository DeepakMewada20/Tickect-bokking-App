import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_movie_ticket/pages/home_screen.dart';
import 'package:my_movie_ticket/pages/login_screen.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class AuthController extends GetxController {
  static AuthController instence = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
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
      Duration(seconds: isLoging ? 0 : 2),
      () {
        if (user == null) {
          isLoging = false;
          update();
          Get.offAll(() => const LoginScreen());
        } else {
          isLoging = true;
          update();
          Get.offAll(() => const HomeScreen());
        }
      },
    );
  }

  void registorUser(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackeBar("Acount creation fail", e.message);
    }
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackeBar("login fail", e.message);
    }
  }

  void googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;
    update();
    try {
      googleSignIn.disconnect();
    } catch (e) {
      getErrorSnackeBar("No selected account", e);
    }
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        final crendentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await auth.signInWithCredential(crendentials);
      }
    } on FirebaseAuthException catch (e) {
      getErrorSnackeBar("Google auth fail!", e);
    }
  }

  getErrorSnackeBar(String massage, _) {
    Get.snackbar(
      "Error",
      "$massage\n $_",
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

  void signOut() async {
    await auth.signOut();
  }
}
