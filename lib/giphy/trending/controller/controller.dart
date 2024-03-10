import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class TrendingController extends GetxController {
  RxList<dynamic> list = [].obs;
  RxList<dynamic> urls = [].obs;
  var isDataProcessing = false.obs;
  var isSearchClicked = false.obs;
  var searchController=TextEditingController();

  Future<int> getData(
      {String url =
          'https://api.giphy.com/v1/gifs/trending?api_key=i1BML5MfEjN0YwcNlE0SRGuUEzb8ZXNA&limit=200'}) async {
    var request = http.Request('GET', Uri.parse(url));
    print(url);
    try {
      isDataProcessing(true);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> map =
            jsonDecode(await response.stream.bytesToString());
        list.clear();
        map.forEach((key, value) {
          if (key == "data") {
            list.addAll(value);
            list.forEach((element) {
              urls.add(element["images"]["original"]["url"]);
              print(urls.length);


              // urls.add(\);
            });
          }
        });
      }
      isDataProcessing(false);

      return 0;
    } catch (x) {
      isDataProcessing(false);

      print(x);
    }
    return 0;
  }

  Future<int> getMoreData(
      {String url =
          'https://api.giphy.com/v1/gifs/trending?api_key=i1BML5MfEjN0YwcNlE0SRGuUEzb8ZXNA&limit=12992'}) async {
    var request = http.Request('GET', Uri.parse(url));
    try {
      // isDataProcessing(true);

      http.StreamedResponse response = await request.send();
      print(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> map =
            jsonDecode(await response.stream.bytesToString());

        map.forEach((key, value) {
          if (key == "data") {
            list.addAll(value);
          }
        });
      }
      list.refresh();
      isDataProcessing(false);

      return 0;
    } catch (x) {
      print(x);
      isDataProcessing(false);

    }
    return 0;
  }
}
