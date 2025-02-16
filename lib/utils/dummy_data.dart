import 'package:my_movie_ticket/modal/ad_slider_modal.dart';
import 'package:my_movie_ticket/modal/menu_modal.dart';
import 'package:my_movie_ticket/utils/constants.dart';

List<AdSliderModal> sliderData = [
  const AdSliderModal(
      url: "assets/images/slider_banner.png",
      redirectUrl: Constants.baseApiUrl),
  const AdSliderModal(
      url: "assets/images/slider_banner.png",
      redirectUrl: Constants.baseApiUrl),
  const AdSliderModal(
      url: "assets/images/slider_banner.png",
      redirectUrl: Constants.baseApiUrl),
];

List<MenuModal> manus = [
  const MenuModal(name: "Movie", assets: "assets/icons/film.svg"),
  const MenuModal(name: "Events", assets: "assets/icons/spotlights.svg"),
  const MenuModal(name: "Plays", assets: "assets/icons/theater_masks.svg"),
  const MenuModal(name: "Sports", assets: "assets/icons/running.svg"),
  const MenuModal(name: "Activity", assets: "assets/icons/flag.svg"),
  const MenuModal(name: "Monum", assets: "assets/icons/pyramid.svg"),
];

List<String> citys = [
  "Indore",
  "New Delhi",
  "Banglore",
  "Kolkata",
  "Chennai",
  "Lucknow",
];
