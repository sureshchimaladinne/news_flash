import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../models/news_model.dart';
import '../views/news_detail_screen.dart';


class NewsItemWidget extends StatelessWidget {
  final NewsArticle newsArticle;

  NewsItemWidget({required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(newsArticle.imageUrl, width: 50, height: 50),
      title: Text(newsArticle.title.tr),
      onTap: () {
        Get.to(ArticleDetailScreen(article: newsArticle));
      },
    );
  }
}
