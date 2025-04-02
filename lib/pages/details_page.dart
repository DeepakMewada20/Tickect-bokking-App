import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/modal/movie_modal.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';
import 'package:my_movie_ticket/widgets/offer_block.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  late final MovieModel modal = Get.arguments;

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
                  bolck1(modal),
                  const SizedBox(
                    height: 30,
                  ),
                  const OfferBlock(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
