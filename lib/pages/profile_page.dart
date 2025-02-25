import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
              height: 150,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: MyTheme.appBarColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text(
                        "Name",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFFE4EDFF),
                                ),
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                print("edit");
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Color(0xFF4C7EFF),
                                  size: 27,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text(
                        "Email",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFFE4EDFF),
                              ),
                              child: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFFCC80EA),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text(
                        "Mobile",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFFE4EDFF),
                              ),
                              child: const Icon(
                                Icons.phone_android_outlined,
                                color: Color(0xFF4C7EFF),
                              ),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              print("edit");
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF4C7EFF),
                                size: 27,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: MyTheme.greyColor,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 35),
                      child: Text(
                        "DOCUMANTETION",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: Icon(
                          Icons.privacy_tip_outlined,
                          size: 22,
                        ),
                        title: Text("privacy polisy"),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: Icon(
                          Icons.share_outlined,
                          size: 22,
                        ),
                        title: Text("Share"),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          size: 22,
                          color: Colors.red,
                        ),
                        title: Text(
                          "Loge Out",
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: MediaQuery.of(context).size.width * 0.5 - 60,
              child: Center(
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
            ),
            Positioned(
              top: 170,
              left: MediaQuery.of(context).size.width * 0.5 + 15,
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
