import 'package:my_movie_ticket/modal/ad_slider_modal.dart';
import 'package:my_movie_ticket/modal/crew_cast_model.dart';
import 'package:my_movie_ticket/modal/event_model.dart';
import 'package:my_movie_ticket/modal/menu_modal.dart';
import 'package:my_movie_ticket/modal/movie_modal.dart';
import 'package:my_movie_ticket/modal/offer_modal.dart';
import 'package:my_movie_ticket/modal/theatre_model.dart';
import 'package:my_movie_ticket/utils/constants.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

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
List<OfferModel> offers = [
  OfferModel(
    title: "Wait ! Grab FREE reward",
    description: "Book your seats and tap on the reward box to claim it.",
    expiry: DateTime(2022, 4, 15, 12),
    startTime: DateTime(2022, 3, 15, 12),
    discount: 100,
    color: MyTheme.redTextColor,
    gradientColor: MyTheme.redGiftGradientColors,
  ),
  OfferModel(
    title: "Wait ! Grab FREE reward",
    description: "Book your seats and tap on the reward box to claim it.",
    expiry: DateTime(2022, 4, 15, 12),
    startTime: DateTime(2022, 3, 15, 12),
    discount: 100,
    color: MyTheme.greenTextColor,
    gradientColor: MyTheme.greenGiftGradientColors,
    icon: "gift_green.svg",
  ),
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
  EventModel(
      title: "dances",
      description: "description ",
      bannerUrl: "assets/events/event1.png",
      date: "date"),
  EventModel(
      title: "shindigs",
      description: "description",
      bannerUrl: "assets/events/event2.png",
      date: "date"),
  EventModel(
      title: "functions",
      description: "description",
      bannerUrl: "assets/events/event3.png",
      date: "date"),
  EventModel(
      title: "affairs",
      description: "description",
      bannerUrl: "assets/events/event4.png",
      date: "date"),
  EventModel(
      title: "shindigs",
      description: "description",
      bannerUrl: "assets/events/event2.png",
      date: "date"),
];

List<EventModel> plays = [
  EventModel(
      title: "dances",
      description: "description",
      bannerUrl: "assets/plays/play1.png",
      date: "date"),
  EventModel(
      title: "shindigs",
      description: "description",
      bannerUrl: "assets/plays/play2.png",
      date: "date"),
  EventModel(
      title: "functions",
      description: "description",
      bannerUrl: "assets/plays/play3.png",
      date: "date"),
  EventModel(
      title: "affairs",
      description: "description",
      bannerUrl: "assets/plays/play4.png",
      date: "date"),
  EventModel(
      title: "shindigs",
      description: "description",
      bannerUrl: "assets/plays/play2.png",
      date: "date"),
];

List<String> citys = [
  "Indore",
  "New Delhi",
  "Banglore",
  "Kolkata",
  "Chennai",
  "Lucknow",
];

List<CrewCastModel> crewCast = [
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Chadwick",
    image: "assets/actors/chadwick.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Letitia Wright",
    image: "assets/actors/LetitiaWright.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "B. Jordan",
    image: "assets/actors/b_jordan.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Lupita Nyongsdfafadfa",
    image: "assets/actors/lupita_nyong.png",
  ),
];

List<TheatreModel> theatres = [
  TheatreModel(id: "1", name: "Arasan Cinemas A/C 2K Dolby"),
  TheatreModel(id: "2", name: "INOX - Prozone mall"),
  TheatreModel(id: "3", name: "Karpagam theatres - 4K Dolby Atoms"),
  TheatreModel(id: "4", name: "KG theatres - 4K"),
];

List<String> facilityAsset = [
  "assets/icons/cancel.svg",
  "assets/icons/parking.svg",
  "assets/icons/cutlery.svg",
  "assets/icons/rocking_horse.svg",
];

List<String> screens = [
  "3D",
  "2D",
];
