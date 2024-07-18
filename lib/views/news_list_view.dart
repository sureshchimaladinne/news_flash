import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsflash/models/news_model.dart';
import 'package:newsflash/widgets/news_item_widget.dart';

class NewsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('news'.tr),
      ),
      body: ListView.builder(
        itemCount: dummyNewsArticles.length,
        itemBuilder: (context, index) {
          return NewsItemWidget(newsArticle: dummyNewsArticles[index]);
        },
      ),
    );
  }
}
