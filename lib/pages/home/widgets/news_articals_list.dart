import 'package:flutter/material.dart';

import '../../../core/network_layer/api_manager.dart';
import '../../../models/articals_model.dart';
import '../../../models/source_model.dart';
import 'news_artical_item.dart';

class NewsArticalsList extends StatelessWidget {
  final Source sourc;
  final String searchQuery;

  const NewsArticalsList({
    super.key,
    required this.sourc,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchArticals(sourc.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Original full list
        List<Articles> allArticles = snapshot.data?.articles ?? [];

        // Filter based on searchQuery
        List<Articles> filteredArticles = searchQuery.isEmpty
            ? allArticles
            : allArticles.where((article) {
                return article.title
                        ?.toLowerCase()
                        .contains(searchQuery.toLowerCase()) ??
                    false;
              }).toList();

        // If no results match
        if (filteredArticles.isEmpty) {
          return const Center(
            child: Text(
              'No articles match your search.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: filteredArticles.length,
          itemBuilder: (context, index) =>
              NewsArticalItem(articles: filteredArticles[index]),
        );
      },
    );
  }
}
