import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_ticket/pages/login_screen.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';
import 'package:my_movie_ticket/utils/social_buttons.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset("assets/icons/splash_icon.svg"),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create to your Accound",
                      style: TextStyle(
                          fontSize: 15,
                          color: MyTheme.splash,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Name",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(145, 0, 0, 0)),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Email Address",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(145, 0, 0, 0)),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(145, 0, 0, 0)),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          hintText: "Conferm Password",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(145, 0, 0, 0)),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.splash,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.black.withOpacity(0.7),
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.black.withOpacity(0.7),
                            thickness: 0.5,
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SocialButtons(
                        onGoogleClick: () {},
                        onFacebookClick: () {},
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "I have an acount ? ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "Login ",
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const LoginScreen()));
                        },
                    ),
                    const TextSpan(
                      text: "hear.",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
