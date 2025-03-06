import 'package:flutter/material.dart';
import 'package:my_movie_ticket/modal/menu_modal.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class VeiwAllScreen extends StatefulWidget {
  const VeiwAllScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _VeiwAllScreenState();
  }
}

class _VeiwAllScreenState extends State<VeiwAllScreen> {
  @override
  Widget build(BuildContext context) {
    MenuModal manu = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(manu.name),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegete());
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search_rounded),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}

//search class where you search your things
class MySearchDelegete extends SearchDelegate<String> {
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
    final results = movies
        .where(
            (movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(results[index].title),
          onTap: () {
            close(context, results[index].title); // Return selected item
          },
        );
      },
    );
    // throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? movies
        : movies
            .where(
              (element) => element.title.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(suggestionList[index].title),
          onTap: () {
            query = suggestionList[index].title;
            showResults(context); // Show results when tapped
          },
        );
      },
    );
  }
}
