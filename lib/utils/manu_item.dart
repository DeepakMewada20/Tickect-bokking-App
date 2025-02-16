import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class ManuItem extends StatelessWidget {
  const ManuItem({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final topMargin=size.height*0.07;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.025),
      height: size.height * 0.1,
      width: size.width,
      //color: Colors.red,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: manus.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                onTap: () {
                  print(manus[i].name);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      manus[i].assets,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      manus[i].name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
