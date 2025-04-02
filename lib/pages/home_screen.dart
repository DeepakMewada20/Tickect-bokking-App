import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/controllers/auth_controller.dart';
import 'package:my_movie_ticket/controllers/location_controller.dart';
import 'package:my_movie_ticket/controllers/shared_pref.dart';
import 'package:my_movie_ticket/pages/profile_page.dart';
import 'package:my_movie_ticket/pages/select_location_screen.dart';
import 'package:my_movie_ticket/utils/constants.dart';
import 'package:my_movie_ticket/utils/custom_slider.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';
import 'package:my_movie_ticket/utils/events_item.dart';
import 'package:my_movie_ticket/utils/manu_item.dart';
import 'package:my_movie_ticket/utils/map_showing.dart';
import 'package:my_movie_ticket/utils/movies_item.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = citys[0];
  @override
  void initState() {
    SharedPref.getLocation().then((value) => city = value);
    super.initState();
    Get.put(
      LocationController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar),
    );
    String? picUrl = AuthController.instence.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAwatar;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 5,
              bottom: 5,
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(const ProfilePage());
              },
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
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AuthController.instence.user!.displayName ?? "Name",
                style: const TextStyle(color: Colors.white),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectLocationScreen());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocationController.instence.city.value,
                        style: TextStyle(
                            color: Colors.white.withAlpha(150),
                            fontSize: 17,
                            inherit: true),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white.withAlpha(150),
                        size: 23,
                      )
                    ],
                  ),
                ),
              )
              // DropdownButton<String>(
              //   value: cityName,
              //   dropdownColor: MyTheme.appBarColor,
              //   isDense: true,
              //   underline: const SizedBox(),
              //   icon: Icon(
              //     Icons.keyboard_arrow_down_sharp,
              //     color: Colors.white.withValues(alpha: 0.7),
              //   ),
              //   items: citys
              //       .map(
              //         (e) => DropdownMenuItem<String>(
              //           value: e,
              //           child: Text(
              //             e,
              //             style: const TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       )
              //       .toList(),
              //   onChanged: (st) => setCityName(st!),
              // ),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  iconSize: 30,
                  icon: const Icon(Icons.search_rounded),
                ),
                IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    iconSize: 30,
                    icon: const Icon(Icons.notifications_none_rounded))
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: size.height * 0.2,
                width: size.width,
                color: Colors.red,
                child: PageView.builder(
                    itemCount: sliderData.length,
                    itemBuilder: (context, i) {
                      return CustomSlider(
                        index: i,
                      );
                    }),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: Text(
                  "SEAT CETEGORIES",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const ManuItem(),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 17,
                ),
                child: Text(
                  "RECOMANDDED MOVIES",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const MoviesItem(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "NEARBY THEATERS",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(color: MyTheme.splash, fontSize: 15),
                        ))
                  ],
                ),
              ),
              const MapShowing(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/spotlights.svg",
                          color: Colors.black.withAlpha(200),
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "events".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(color: MyTheme.splash, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              EventsItem(
                events: events,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/theater_masks.svg",
                          color: Colors.black.withAlpha(200),
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "plays".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(color: MyTheme.splash, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              EventsItem(events: plays),
            ],
          ),
        ),
      ),
    );
  }
}
