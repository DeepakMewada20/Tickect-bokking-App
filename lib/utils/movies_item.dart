import 'package:flutter/material.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

import 'package:my_movie_ticket/widgets/item_block.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.24,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, i) {
            return ItemBlock(modal: movies[i],isMovie: true,);
          }),
    );
  }
}
