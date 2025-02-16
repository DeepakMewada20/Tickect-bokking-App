import 'package:flutter/material.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class CustomSlider extends StatelessWidget {
  final index;
  const CustomSlider({super.key, this.index});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: Image.asset(
        sliderData[index].url,
        fit: BoxFit.cover,
      ),
    );
  }
}
