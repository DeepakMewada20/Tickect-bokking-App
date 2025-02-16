import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.only(left: 20),
      //padding: const EdgeInsets.only(left: 10, right: 10),
      height: size.height * 0.3,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Image.asset(
                    movies[i].bannerUrl,
                    width: 100,
                    height: 150,
                  ),
                  Text(
                    "${movies[i].title}",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
