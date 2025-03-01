import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:my_movie_ticket/pages/home_screen.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';
import 'package:my_movie_ticket/controllers/location_controller.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SelectLocationScreenState();
  }
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(LocationController());
  }

  Widget myLocationWidget = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: GestureDetector(
      onTap: () async {
        LocationController.instence.isLocating(true);
        await LocationController.instence.getLocation();

        Get.offAll(() => const HomeScreen());
      },
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
    "kolkata",
    "Bhopal",
    "Hedradad",
    "Indore",
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
        builder: (context, constraints) => Obx(
          () => LoadingOverlay(
            isLoading: LocationController.instence.isLocating.value,
            progressIndicator: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(MyTheme.appBarColor),
            ),
            child: SizedBox(
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
                        itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              LocationController.instence.setCity(citys[index]);
                              Get.offAll(() => const HomeScreen());
                            },
                            child: sagesedCitys(citys[index])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17),
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
        ),
      ),
    );
  }
}
