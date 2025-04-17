import 'package:flutter/material.dart';

import '../../../core/network_layer/api_manager.dart';
import '../../../models/source_model.dart';
import '../home_view.dart';
import 'news_details.dart';

class NewsView extends StatefulWidget {
  final CategoryData categoryData;
  final String searchQuery;

  const NewsView({
    super.key,
    required this.categoryData,
    required this.searchQuery,
  });

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceModel>(
      future: ApiManager.fetchSources(widget.categoryData.categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final sourceModel = snapshot.data!;
        return NewsDetails(
          sourceModel: sourceModel,
          searchQuery: widget.searchQuery,
        );
      },
    );
  }
}
