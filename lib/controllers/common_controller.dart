import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class CommonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();
  late TabController tabController;
  late List<Tab> tabs;
  late RxString screen;

  final tabList = ["Now showing", "Up coming", "Exclusive"];

  @override
  void onInit() {
    tabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    tabs = tabList.map((e) => Tab(text: e)).toList();
    screen = screens[0].obs;
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();

    super.dispose();
  }

  final PageController pageController = PageController(
    keepPage: false,
  );

  updatePage(int index) async {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  updateScreen(String screen) {
    this.screen = screen.obs;
    update();
  }
}
