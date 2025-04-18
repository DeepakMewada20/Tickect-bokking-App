import 'package:flutter/material.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class ItemBlock extends StatelessWidget {
  final dynamic modal;
  final bool isMovie;
  final double higet;
  final double width;
  final Function(dynamic modal) onTap;
  const ItemBlock(
      {required this.modal,
      this.isMovie = false,
      this.higet = 150,
      this.width = 120,
      required this.onTap,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: GestureDetector(
        onTap: () {
          onTap(modal);
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  modal.bannerUrl,
                  width: width,
                  height: higet,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                modal.title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              isMovie == true
                  ? Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: MyTheme.splash,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${modal.like}%",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: width,
                      child: Text(
                        modal.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
