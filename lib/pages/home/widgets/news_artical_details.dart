import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/articals_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Articles article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(article.source?.name ?? "News Title"),
          centerTitle: true,
          backgroundColor: const Color(0xFF39A552),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              if (article.urlToImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(article.urlToImage!),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.source?.name ?? "",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          article.publishedAt?.substring(0, 10) ?? "",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      article.title ?? "",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      article.description ?? "No description available.",
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(article.url ?? ''));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "View Full Article",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF42505C),
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 40,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
