import 'package:flutter/material.dart';
import 'package:my_movie_ticket/modal/menu_modal.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';
import 'package:my_movie_ticket/widgets/item_block.dart';

class VeiwAllScreen extends StatefulWidget {
  const VeiwAllScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _VeiwAllScreenState();
  }
}

class _VeiwAllScreenState extends State<VeiwAllScreen> {
  MenuModal manu = Get.arguments;
  late List<dynamic> list;

  @override
  void initState() {
    if (manu.name.contains("Movie")) {
      list = movies;
    } else if (manu.name.contains("Events")) {
      list = events;
    } else {
      list = plays;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(manu.name),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegete(
                    isMovie:
                        (manu.name.toLowerCase() == "movie") ? true : false,
                    list: list),
              );
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
  final bool isMovie;
  final List<dynamic> list;
  MySearchDelegete({this.isMovie = false, required this.list});

  resultWidget(dynamic modal) {
    return ItemBlock(
      modal: modal,
      isMovie: isMovie,
      higet: 200,
      width: 180,
    );
  }

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
        ? list
        : list
            .where(
              (element) => element.title.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return LayoutBuilder(builder: (context, constraint) {
      return GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraint.maxWidth > 500 ? 4 : 2,
          // mainAxisSpacing: 5,
          // crossAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (_, index) {
          return resultWidget(suggestionList[index]);
        },
        itemCount: suggestionList.length,
      );
    });
  }
}
