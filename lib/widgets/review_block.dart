import 'package:flutter/material.dart';
import 'package:my_movie_ticket/controllers/auth_controller.dart';
import 'package:my_movie_ticket/utils/constants.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class ReviewBlock extends StatelessWidget {
  const ReviewBlock({super.key});
  @override
  Widget build(BuildContext context) {
    String? picUrl = AuthController.instence.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAwatar;
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "1043 reviews",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Write yours >",
                    style: TextStyle(
                      color: MyTheme.splash,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  picUrl,
                ),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AuthController.instence.user!.displayName ??
                          "No Name",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 15),
                    ),
                    const WidgetSpan(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    const TextSpan(
                      text: "04 April, 2025",
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    )
                  ],
                ),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "With all the updates after the last few months the app has improved a lot. Keeps me up to date.",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
