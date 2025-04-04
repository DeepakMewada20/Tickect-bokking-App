import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_movie_ticket/controllers/calendar_controller.dart';
import 'package:my_movie_ticket/controllers/common_controller.dart';
import 'package:my_movie_ticket/controllers/seat_selection_controller.dart';
import 'package:my_movie_ticket/modal/movie_modal.dart';
import 'package:my_movie_ticket/pages/seat_selection_screen.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';
import 'package:my_movie_ticket/widgets/theatre_block.dart';

import '../utils/screen_selection_block.dart';

class ListCinemaScreen extends StatefulWidget {
  final MovieModel model;
  const ListCinemaScreen({required this.model, super.key});

  @override
  State<ListCinemaScreen> createState() => _ListCinemaScreenState();
}

class _ListCinemaScreenState extends State<ListCinemaScreen> {
  final DateFormat format = DateFormat("dd MMM");

  final now = DateTime.now();

  DateTime? _selectedDate;

  String selectedDate = DateFormat("dd MMM").format(DateTime.now());

  String selectedLanguage = "English";

  String selectedScreen = "3D";
  late CalendarController commonController;

  void _presentDatePeker() async {
    final currentDate = DateTime.now();
    final firstDate = currentDate;
    final lastDate =
        DateTime(currentDate.year + 1, currentDate.month, currentDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void initState() {
    commonController = Get.put(CalendarController());
    Get.put(SeatSelectionController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedDate = DateFormat("dd MMM").format(
      _selectedDate ?? DateTime.now(),
    );
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: MyTheme.appBarColor,
        child: SizedBox(
          width: double.maxFinite,
          height: AppBar().preferredSize.height,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: StatefulBuilder(builder: (context, setState) {
                  final todayDate = format.format(now);
                  final tomorrowDate =
                      format.format(now.add(const Duration(days: 1)));
                  String dayText = "";

                  if (selectedDate == todayDate) {
                    dayText = "Today, ";
                  } else if (selectedDate == tomorrowDate) {
                    dayText = "Tomorrow, ";
                  } else {
                    dayText =
                        "${DateFormat("EEE").format(_selectedDate ?? commonController.selectedMovieDate.value)}, ";
                  }
                  return ListTile(
                    onTap: () {
                      _presentDatePeker();
                    },
                    textColor: Colors.white,
                    horizontalTitleGap: 4,
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    title: Text(
                      "$dayText,$selectedDate",
                      style: const TextStyle(fontSize: 15),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
              Expanded(
                flex: 5,
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => ScreenSelectionBlock(
                        onScreenSelect: (screen) {
                          CommonController.instance.updateScreen(screen);
                          setState(() => selectedScreen = screen);
                        },
                      ),
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.25),
                    );
                  },
                  horizontalTitleGap: 0,
                  textColor: Colors.white,
                  title: Text(
                    "$selectedLanguage,$selectedScreen",
                    style: const TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5Fa),
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.model.title),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: TheatreSearchDelegate(widget.model),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search_rounded),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: theatres.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                  bottom: index != theatres.length - 1 ? 20 : 0),
              child: TheatreBlock(
                TheaterIndex: index,
                model: theatres[index],
                onTimeTap: (index) {
                  Get.to(() => SeatSelectionScreen(
                      theatreModel: theatres[index], movieModel: widget.model,));
                },
              ),
            );
          }),
    );
  }
}

class TheatreSearchDelegate extends SearchDelegate {
  final MovieModel model;
  TheatreSearchDelegate(this.model);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null.toString());
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? theatres
        : theatres
            .where(
              (element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: suggestionList.length,
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.only(
              bottom: index != suggestionList.length - 1 ? 20 : 0),
          child: TheatreBlock(
            TheaterIndex: index,
            model: suggestionList[index],
            onTimeTap: (index) {
              Get.to(() => SeatSelectionScreen(
                  theatreModel: suggestionList[index], movieModel: model));
            },
          ),
        );
      },
    );
  }
}
