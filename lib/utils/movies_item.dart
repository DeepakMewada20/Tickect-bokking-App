import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  print(movies[i].title);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        movies[i].bannerUrl,
                        width: 120,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      movies[i].title,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: MyTheme.splash,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${movies[i].like}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
