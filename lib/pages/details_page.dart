import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/pages/list_cinema_screen.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';
import 'package:my_movie_ticket/widgets/cast_crew_block.dart';
import 'package:my_movie_ticket/widgets/offer_block.dart';
import 'package:my_movie_ticket/widgets/review_block.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  final dynamic modal = Get.arguments;
  //final int index = Get.arguments;

  titalWidget(modal) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            modal.title,
            style: const TextStyle(
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
                size: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${modal.like}%",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      );

  final screensWidget = Row(
    children: [
      const Text(
        "English",
        style: TextStyle(color: MyTheme.splash, fontSize: 15),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        color: MyTheme.splash.withAlpha(30),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          child: Text(
            "2D",
            style: TextStyle(color: MyTheme.splash, fontSize: 15),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        color: MyTheme.splash.withAlpha(30),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          child: Text(
            "3D",
            style: TextStyle(color: MyTheme.splash, fontSize: 15),
          ),
        ),
      ),
    ],
  );
  final movieDuretionWidget = RichText(
    text: TextSpan(
      children: [
        const WidgetSpan(
          child: Icon(
            Icons.history,
            size: 17,
            color: Colors.black45,
          ),
        ),
        const WidgetSpan(
          child: SizedBox(
            width: 10,
          ),
        ),
        const TextSpan(
          text: "2h 36m",
          style: TextStyle(
            color: Colors.black45,
            fontSize: 15,
          ),
        ),
        const WidgetSpan(
          child: SizedBox(
            width: 10,
          ),
        ),
        WidgetSpan(
          child: SvgPicture.asset(
            "assets/icons/theater_masks.svg",
            color: Colors.black45,
            width: 18,
            height: 18,
          ),
        ),
        const WidgetSpan(
          child: SizedBox(
            width: 10,
          ),
        ),
        const TextSpan(
          text: "Acation, Drama",
          style: TextStyle(
            color: Colors.black45,
            fontSize: 15,
          ),
        ),
      ],
    ),
  );

  bolck1(modal) => Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titalWidget(modal),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "UA | Oct 15, 2024",
                    style: TextStyle(color: Colors.black45, fontSize: 15),
                  ),
                  Text(
                    "2.6K Votes",
                    style: TextStyle(color: MyTheme.splash, fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              screensWidget,
              const SizedBox(
                height: 7,
              ),
              movieDuretionWidget,
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar),
    );
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              () => ListCinemaScreen(model: modal),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: MyTheme.splash,
            elevation: 0,
          ),
          child: Container(
            width: double.maxFinite,
            height: 50,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/armchair.svg",
                  color: Colors.white,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Book Seats",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: MyTheme.appBarColor,
            expandedHeight: 200,
            foregroundColor: Colors.white,
            pinned: true,
            title: Text(modal.title),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "${modal.title}",
                child: Container(
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
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Container(
              color: const Color(0xFFF5F5Fa),
              child: SingleChildScrollView(
                //physics: ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bolck1(modal),
                    const SizedBox(
                      height: 30,
                    ),
                    const OfferBlock(),
                    const SizedBox(
                      height: 30,
                    ),
                    const ReviewBlock(),
                    const SizedBox(
                      height: 30,
                    ),
                    const CrewCastBlock(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
