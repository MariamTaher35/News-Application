import 'package:flutter/material.dart';

import '../../../models/articals_model.dart';
import 'news_artical_details.dart';

class NewsArticalItem extends StatelessWidget {
  final Articles articles;

  const NewsArticalItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(articles.urlToImage ?? ""),
        ),
        const SizedBox(height: 10),
        Text(
          articles.source?.name ?? "",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF79828B),
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailsScreen(article: articles),
              ),
            );
          },
          child: Text(
            articles.title ?? "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF42505C),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
