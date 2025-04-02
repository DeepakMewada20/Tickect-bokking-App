import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/modal/movie_modal.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  final MovieModel modal = Get.arguments;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: MyTheme.appBarColor,
            expandedHeight: 200,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/movie_banner.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: const Color(0xFFF5F5Fa),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                modal.title,
                                style:const  TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                 const Icon(
                                    Icons.favorite,
                                    color: MyTheme.splash,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${modal.like}%",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "UA | Oct 15, 2024",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                              ),
                              Text(
                                "2.6K Votes",
                                style: TextStyle(
                                    color: MyTheme.splash, fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "English",
                                style: TextStyle(
                                    color: MyTheme.splash, fontSize: 15),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: MyTheme.splash.withAlpha(30),
                                child: const Padding(
                                  padding:  EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 4),
                                  child: Text(
                                    "2D",
                                    style: TextStyle(
                                        color: MyTheme.splash, fontSize: 15),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: MyTheme.splash.withAlpha(30),
                                child: const Padding(
                                  padding:  EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 4),
                                  child: Text(
                                    "3D",
                                    style: TextStyle(
                                        color: MyTheme.splash, fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    size: 20,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "2h 36m",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/theater_masks.svg",
                                    color: Colors.black45,
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Acation, Drama",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
