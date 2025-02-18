import 'package:flutter/material.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({super.key});
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
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                print(events[i].title);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      events[i].bannerUrl,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    events[i].title.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    events[i].description.toUpperCase(),
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
