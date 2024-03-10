
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwww/giphy/trending/view/view.dart';
import 'package:newwww/home/controller/controller.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          Get.changeThemeMode(Get.isDarkMode?
          ThemeMode.light
                : ThemeMode.dark,
          );
          setState(() {

          });

        },child: Icon( !Get.isDarkMode?Icons.sunny:Icons.shield_moon),
        ),
        appBar: AppBar(
          bottom:  TabBar(controller: controller.tabController,
            tabs: const [
              Tab(icon: Icon(Icons.feed), text: "Feeds"),
              Tab(icon: Icon(Icons.upcoming_outlined), text: "Trending",),

            ],
          ),
          title: const Text('Featuring Gifs'),actions: [
            IconButton(onPressed: (){}, icon: Icon(!Get.isDarkMode?Icons.sunny:Icons.shield_moon))
        ],
        ),
        body:  TabBarView(
          children: [
            Trending(),
            Trending(),
          ],
        ),
      ),
    );
  }
}


