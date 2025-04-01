import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();
  late TabController tabController;
  late List<Tab> tabs;

  final tabList = ["Now showing", "Up coming", "Exclusive"];

  @override
  void onInit() {
    tabController = TabController(
        length: tabList.length, vsync: this,);
    tabs = tabList.map((e) => Tab(text: e)).toList();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();

    super.dispose();
  }

  final PageController pageController = PageController(keepPage: false,);

  updatePage(int index) async {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

}
