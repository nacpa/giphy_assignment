import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwww/giphy/trending/controller/controller.dart';

class HomeController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;
  var selectedindex = 0.obs;

  var controller = Get.isRegistered<TrendingController>()
      ? Get.find<TrendingController>()
      : Get.put(TrendingController());

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    handleTabSelection(tabController);
    // tabController!.addListener(() {
    //
    // });
    super.onInit();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  void handleTabSelection(TabController? tabController) {

    tabController?.addListener(() {

      if(tabController.index==0){
       controller.getData(url: "https://api.giphy.com/v2/emoji?api_key=i1BML5MfEjN0YwcNlE0SRGuUEzb8ZXNA&limit=200&offset=new" );
      } else if(tabController.index==1){
        controller.getData();


      }
    });

    // print("--->>>>>>Tab changeed to ${tabController?.index}");
    selectedindex.value = tabController!.index;
  }
}
