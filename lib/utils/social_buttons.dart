import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class SocialButtons extends StatelessWidget {
  final Function() onGoogleClick;
  final Function() onFacebookClick;
  const SocialButtons(
      {super.key, required this.onGoogleClick, required this.onFacebookClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Material(
            color: MyTheme.redLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: MyTheme.redBorder, width: 0.2),
            ),
            child: InkWell(
              onTap: onGoogleClick,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/google.svg",
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Google",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Material(
            color: MyTheme.blueLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side:const BorderSide(color: MyTheme.blueBorder,width: 0.2),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/facebook.svg",
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Facebook",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
