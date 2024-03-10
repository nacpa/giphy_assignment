import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwww/giphy/trending/controller/controller.dart';
import 'package:newwww/services/lazy_load_scrollview.dart';


class Trending extends StatelessWidget {


  var controller = Get.isRegistered<TrendingController>()
      ? Get.find<TrendingController>()
      : Get.put(TrendingController());

  Future<Widget> myWidgetFuture(context) async {
    final data = await controller.getData(url: "https://api.giphy.com/v2/emoji?api_key=i1BML5MfEjN0YwcNlE0SRGuUEzb8ZXNA&limit=400&offset=new");
    return buildDesign(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: myWidgetFuture(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!; // Return the built StatelessWidget
        } else if (snapshot.hasError) {
          return const Center(child: Text("No data Found"),);
        } else {
          return Center(
              child: shimmerContainer(context)); // Show loading indicator
        }
      },
    );
  }



  shimmerContainer(context) {
    return const Scaffold(
      body:Center(child: CircularProgressIndicator(color:Colors.blueGrey,),),
    );
  }

   buildDesign(context) {
    return Obx(() =>controller.isDataProcessing.isTrue?shimmerContainer(context): Column(
      children: [
        searchBar(context),
        Expanded(
          child: LazyLoadScrollView(
            onEndOfPage: () {
              controller.getMoreData();
            },
            isLoading: false,
            scrollOffset: 100,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
              ),
              padding: const EdgeInsets.all(8.0), // padding around the grid
              itemCount:controller.list.length, // total number of items
              itemBuilder: (context, index) {
                if (controller.list[index]["title"]
                    .toLowerCase()
                    .contains(controller.searchController.text
                    .trim()
                    .toLowerCase())) {
                  return Container(
                    color: Colors.greenAccent.withOpacity(0.1), // color of grid items
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(flex: 9,
                              child: Image.network(controller.list[index]["images"]["original"]["url"])),
                          Flexible(flex: 1,
                            child: Text(
                                controller.list[index]["title"]??"NA"
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }


              },
            ),
          ),
        ),
      ],
    )


    );
  }

  searchBar(BuildContext context) {
    return Obx(() => controller.isSearchClicked.value == false
        ? Align(alignment: Alignment.centerRight,
          child: IconButton(
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {
            controller.isSearchClicked.value = true;
          }),
        )
        : Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: EdgeInsets.only(
                top: 10, left: 18, bottom: 10, right: 18),
            child: textfield())));
  }

  textfield() {
    return TextField(
      autofocus: true,
      controller: controller.searchController,
      //textAlign: TextAlign.values.first,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: TextStyle( fontSize: 16),

      onChanged: (data) {
        // _listViewKey.currentState?.build(Get.context!);
        controller.list.refresh();
      }, //
      onSubmitted: (data) {
        controller.list.refresh();
        // controller.getData(url: "https://api.giphy.com/v1/tags/related/${controller.searchController.text.trim()}?api_key=i1BML5MfEjN0YwcNlE0SRGuUEzb8ZXNA");
      },
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(width: 2, ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(width: 2,
              // color: ConstantsColors.primaryColor
          ),
        ),
        prefixIcon: IconButton(
            onPressed: () {
              controller.searchController.clear();
              controller.list.refresh();
              controller.isSearchClicked.value = false;
              // onRef();
            },
            icon: Icon(
              Icons.arrow_back,
              // color: ConstantsColors.primaryColor,
            )),
        hintText: "search".tr,
        hintStyle: TextStyle(
          // color: ConstantsColors.primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        suffixIcon: controller.searchController.text.isNotEmpty
            ? InkWell(
          onTap: () {
            controller.searchController.clear();
            controller.list.refresh();
          },
          child: Icon(
            Icons.close,
            // color: ConstantsColors.primaryColor,
          ),
        )
            : GestureDetector(
          onTap: () {
            controller.searchController.clear();
            controller.list.refresh();
          },
          child: Icon(
            Icons.close,
            // color: ConstantsColors.primaryColor,
          ),
        ),
      ),
    );
  }

}

