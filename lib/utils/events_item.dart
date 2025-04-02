import 'package:flutter/material.dart';
import 'package:my_movie_ticket/modal/event_model.dart';
import 'package:my_movie_ticket/widgets/item_block.dart';

class EventsItem extends StatelessWidget {
  final List<EventModel> events;
  const EventsItem({super.key, required this.events});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      //padding: EdgeInsets.only(left: 20),
      height: size.height * 0.25,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, i) {
          return ItemBlock(
            modal: events[i],
            onTap: (modal) {
              print(modal.title);
            },
          );
        },
      ),
    );
  }
}
