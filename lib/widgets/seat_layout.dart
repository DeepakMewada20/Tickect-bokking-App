import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/controllers/seat_selection_controller.dart';
import 'package:my_movie_ticket/modal/seat_layout_model.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

// ignore: must_be_immutable
class SeatLayout extends StatelessWidget {
  final SeatLayoutModel model;
  SeatLayout({super.key, required this.model});
  int alphabetCounter = -1;
  int seatCounter = 0;
  double amount = 0.0;

  Widget mainSeatLayout(
      {required Function(double) seatPrice,
      required double price,
      required String rowNo}) {
    String seatNo = "$seatCounter";
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          RxList seats = SeatSelectionController.instance.selectedSeats;
          RxList seatPriceList = SeatSelectionController.instance.seatPrices;
          //print(price);
          if (seats.contains("$rowNo$seatNo")) {
            seatPriceList.remove(price);
            seats.remove("$rowNo$seatNo");
          } else {
            if (seats.length >=
                SeatSelectionController.instance.noOfSeats.value) {
              seats.removeAt(0);
              seatPriceList.removeAt(0);
              seats.add("$rowNo$seatNo");
              seatPriceList.add(price);
            } else {
              seatPriceList.add(price);
              seats.add("$rowNo$seatNo");
            }
          }

          amount = seatPriceList.fold(0, (prev, e) => prev + e);
          seatPrice(amount < 0 ? 0.0 : amount);
        },
        child: Obx(
          () {
            Color backColor = SeatSelectionController.instance.selectedSeats
                    .contains("$rowNo$seatNo")
                ? MyTheme.greenColor
                : const Color(0xffffffff);
            Color textColor = SeatSelectionController.instance.selectedSeats
                    .contains("$rowNo$seatNo")
                ? Colors.white
                : Colors.black87;
            Color borderColor = SeatSelectionController.instance.selectedSeats
                    .contains("$rowNo$seatNo")
                ? MyTheme.greenColor
                : const Color(0xff707070);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: backColor,
                border: Border.all(
                  width: 0.5,
                  color: borderColor,
                ),
              ),
              child: Center(
                child: Text(
                  seatNo,
                  style: TextStyle(color: textColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int seatLength = model.seatTypes.length;
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset("assets/icons/screen_here.svg"),
          const Text(
            "Screen Here",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: InteractiveViewer(
              panEnabled: false,
              child: ListView.builder(
                itemCount: seatLength,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [                        
                          Text(
                            "\u20B9 ${model.seatTypes[seatLength - index - 1]['price']} ${model.seatTypes[seatLength - index - 1]['title']}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          const SizedBox(                 
                            height: 10,
                          ),
                          ...List.generate(
                            model.rowBreaks[index],
                            (row) {
                              alphabetCounter++;
                              seatCounter = 0;

                              String rowNo =
                                  String.fromCharCode(65 + alphabetCounter);
                              return Wrap(
                                children: List.generate(
                                  model.cols,
                                  (col) {
                                    if (col == 0) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Text(
                                            rowNo,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      );
                                    }
                                    //making gaps
                                    //making last row filled
                                    if ((col == model.gapColIndex ||
                                            col ==
                                                model.gapColIndex +
                                                    model.gap -
                                                    1) &&
                                        (row != model.rowBreaks[index] - 1 &&
                                            model.isLastFilled)) {
                                      return const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                        ),
                                      );
                                    }

                                    //numbering the seats
                                    seatCounter++;
                                    String seatNo = "$seatCounter";
                                    double price =
                                        model.seatTypes[seatLength - index - 1]
                                            ['price'];

                                    return mainSeatLayout(
                                        seatPrice: SeatSelectionController
                                            .instance.seatPrice.call,
                                        price: price,
                                        rowNo: rowNo);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
