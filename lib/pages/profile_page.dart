import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

import '../controllers/auth_controller.dart';
import '../utils/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.appBarColor));
    String? picUrl = AuthController.instence.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAwatar;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Profile Page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: MyTheme.appBarColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: MediaQuery.of(context).size.width / 2.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.5),
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: CachedNetworkImage(
                          imageUrl: picUrl,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    // decoration: InputDecoration(
                    //   prefixIcon: Container(
                    //     width: 25,
                    //     height: 20,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       color: Color(0xFFE4EDFF),
                    //     ),
                    //     child: Icon(
                    //       Icons.person_outline,
                    //       color: Color(0xFF4C7EFF),
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 220,
              left: MediaQuery.of(context).size.width * 0.5 + 30,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: MyTheme.appBarColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
