import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SelectLocationScreenState();
  }
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  Widget myLocationWidget = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: MyTheme.greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.my_location_outlined,
                color: Colors.black45,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "My Current Location",
                style: TextStyle(color: Colors.black45, fontSize: 17),
              )
            ],
          ),
        ),
      ),
    ),
  );
  Widget sagesedLocation(String city) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            city,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  final List<String> citys = [
    "Indore",
    "kolkata",
    "Bhopal",
    "Hedradad",
    "dihli"
  ];
  Widget sagesedCitys(String city) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            city,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            //textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: MyTheme.appBarColor));
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Select Location",
        ),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myLocationWidget,
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GridView.builder(
                    itemCount: citys.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 600 ? 5 : 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 2,
                    ),
                    itemBuilder: (_, index) => sagesedCitys(citys[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                    decoration: InputDecoration(
                      hintText: "search City",
                      fillColor: MyTheme.greyColor,
                      filled: true,
                 
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.black45,
                        size: 23,
                      ),
                      hintStyle: const TextStyle(color: Colors.black45),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
