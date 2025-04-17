import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/constants.dart';
import 'package:news_app/models/source_model.dart';

import '../../models/articals_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String categoryId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
      queryParameters,
    );

    var response = await http.get(uri);

    SourceModel sourceModel = SourceModel.fromJson(jsonDecode(response.body));

    print(response.body);

    return sourceModel;
  }

  static Future<ArticalsModel> fetchArticals(String sourceId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines",
      queryParameters,
    );

    var response = await http.get(uri);

    ArticalsModel articalsModel =
        ArticalsModel.fromJson(jsonDecode(response.body));

    print(response.body);

    return articalsModel;
  }
}
