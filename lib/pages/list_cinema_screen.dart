import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_movie_ticket/controllers/calendar_controller.dart';
import 'package:my_movie_ticket/modal/movie_modal.dart';
import 'package:my_movie_ticket/pages/veiw_all_screen.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';
import 'package:my_movie_ticket/widgets/theatre_block.dart';

class ListCinemaScreen extends StatelessWidget {
  final MovieModel modal;
  ListCinemaScreen({required this.modal, super.key});

  final DateFormat format = DateFormat("dd MMM");

  final now = DateTime.now();

  String selectedDate = DateFormat("dd MMM").format(DateTime.now());

  String selectedLanguage = "English";

  String selectedScreen = "3D";
  late CalendarController commonController;

  @override
  Widget build(BuildContext context) {
    final todayDate = format.format(now);
    final tomorrowDate = format.format(now.add(const Duration(days: 1)));
    String dayText = "";

    if (selectedDate == todayDate) {
      dayText = "Today, ";
    } else if (selectedDate == tomorrowDate) {
      dayText = "Tomorrow, ";
    } else {
      dayText =
          DateFormat("EEE").format(commonController.selectedMovieDate.value) +
              ", ";
    }
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: MyTheme.appBarColor,
        child: Container(
          width: double.maxFinite,
          height: AppBar().preferredSize.height,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: ListTile(
                  onTap: () {},
                  textColor: Colors.white,
                  horizontalTitleGap: 4,
                  leading: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  title: Text(
                    "$dayText,$selectedDate",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                  onTap: () {},
                  horizontalTitleGap: 0,
                  textColor: Colors.white,
                  title: Text(
                    "$selectedLanguage,$selectedScreen",
                    style: TextStyle(fontSize: 15),
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
        title: Text(modal.title),
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(
              //   context: context,
              //   delegate: MySearchDelegete(
              //       isMovie:
              //           (manus.name.toLowerCase() == "movie") ? true : false,
              //       list: list),
              // );
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
                model: theatres[index],
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
              (element) => element.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: suggestionList.length,
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.only(bottom: index != suggestionList.length - 1 ? 20 : 0),
          // child: TheatreBlock(
          //   model: suggestionList[index],
          //   onTimeTap: (index) {
          //     Get.to(() => SeatSelectionScreen(theatreModel: suggestionList[index], movieModel: model));
          //   },
          // ),
        );
      },
    );
  }
}
