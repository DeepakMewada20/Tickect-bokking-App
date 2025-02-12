import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_movie_ticket/controllers/auth_controller.dart';
import 'package:my_movie_ticket/utils/constants.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar),
    );
    String? picUrl = AuthController.instence.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAwatar;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 5,
                  bottom: 5,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: picUrl,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),              
              title: const Column(
                children: [
                  Text(
                    "name",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              AuthController.instence.signOut();
            },
            child: const Text("Home Screen"),
          ),
        ));
  }
}
