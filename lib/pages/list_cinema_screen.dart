import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_movie_ticket/modal/movie_modal.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';
import 'package:my_movie_ticket/widgets/theatre_block.dart';

class ListCinemaScreen extends StatelessWidget {
  final MovieModel modal;
  ListCinemaScreen({required this.modal, super.key});
  final DateFormat format = DateFormat("dd MMM");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: MyTheme.appBarColor,
        child: Container(
          width: double.maxFinite,
          height: AppBar().preferredSize.height,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    format.format(
                      DateTime.now(),
                    ),
                    style: TextStyle(color: Colors.white),
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
              //           (manu.name.toLowerCase() == "movie") ? true : false,
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
