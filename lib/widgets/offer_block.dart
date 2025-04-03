import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_ticket/modal/offer_modal.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class OfferBlock extends StatelessWidget {
  const OfferBlock({super.key});
  offerWidget(BuildContext context, OfferModel modal) => Padding(
        padding: const EdgeInsets.only(right: 20, left: 5, bottom: 2),
        child: DottedBorder(
          //strokeWidth: 1,
          dashPattern: const [4, 5],
          color: Colors.black45,
          padding: const EdgeInsets.all(20),
          radius: const Radius.circular(6),
          child: Row(
            children: [
              Container(
                //width: double.maxFinite,

                padding: const EdgeInsets.only(left: 18, right: 18),
                height: double.maxFinite,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: RadialGradient(
                    colors: modal.gradientColor,
                    radius: 10,
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/icons/${modal.icon}",
                  height: 25,
                  width: 25,
                  // color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modal.title,
                    style: TextStyle(color: modal.color, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      modal.description,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Offers",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: offers.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    offerWidget(context, offers[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
