import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsflash/views/news_list_view.dart';
import 'package:newsflash/views/settings_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('title'.tr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.yellow,
        actions: [IconButton(onPressed: (){
          Get.to(SettingsView());
        }, icon: Icon(Icons.language,color: Colors.black,))],
      ),
      body: NewsListView(),
    );
  }
}
