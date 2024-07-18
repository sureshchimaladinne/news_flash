import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../models/news_model.dart';

class ArticleDetailScreen extends StatelessWidget {
  final NewsArticle article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(article.title.tr,style: TextStyle(fontWeight:FontWeight.bold)),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Add SingleChildScrollView to avoid overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200, // Set a fixed height for the image container
                child: SvgPicture.asset(
                  article.imageUrl,
                  fit: BoxFit.contain, // Set the fit property to contain
                ),
              ),
              SizedBox(height: 16),
              Text(
                article.contentKey.tr,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
