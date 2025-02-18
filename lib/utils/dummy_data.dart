import 'package:my_movie_ticket/modal/ad_slider_modal.dart';
import 'package:my_movie_ticket/modal/event_model.dart';
import 'package:my_movie_ticket/modal/menu_modal.dart';
import 'package:my_movie_ticket/modal/movie_modal.dart';
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

List<MovieModel> movies = [
  MovieModel(
    title: "Bigil",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movie/movie1.png",
  ),
  MovieModel(
    title: "Kaithi",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movie/movie2.png",
  ),
  MovieModel(
    title: "Asuran",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movie/movie3.png",
  ),
  MovieModel(
    title: "Sarkar",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movie/movie4.png",
  ),
];

List<EventModel> events = [
  EventModel(title: "dances", description: "description", bannerUrl: "assets/events/event1.png", date: "date"),
  EventModel(title: "shindigs", description: "description", bannerUrl: "assets/events/event2.png", date: "date"),
  EventModel(title: "functions", description: "description", bannerUrl: "assets/events/event3.png", date: "date"),
  EventModel(title: "affairs", description: "description", bannerUrl: "assets/events/event4.png", date: "date"),
  EventModel(title: "shindigs", description: "description", bannerUrl: "assets/events/event2.png", date: "date"),
];


List<String> citys = [
  "Indore",
  "New Delhi",
  "Banglore",
  "Kolkata",
  "Chennai",
  "Lucknow",
];
