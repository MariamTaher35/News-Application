import 'package:flutter/material.dart';
import 'package:news_app/core/network_layer/api_manager.dart';
import 'package:news_app/models/category_model.dart';

class NewsDetailsView extends StatelessWidget {
  final CategoryModel categoryModel;
  const NewsDetailsView({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.fetchSource(categoryModel.CategoryId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }
}
