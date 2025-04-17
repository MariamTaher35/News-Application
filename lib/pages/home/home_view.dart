import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/category_item.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';
import 'package:news_app/pages/home/widgets/news_view.dart';

import '../../generated/l10n.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryData? selectedCategory;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<CategoryData> categories = [
    CategoryData(
      categoryId: "sports",
      categoryTitle: "Sports",
      categoryImage: "assets/images/sport.png",
      categoryBackgroundColor: const Color(0xFFC91C22),
    ),
    CategoryData(
      categoryId: "general",
      categoryTitle: "Politics",
      categoryImage: "assets/images/politics.png",
      categoryBackgroundColor: const Color(0xFF003E90),
    ),
    CategoryData(
      categoryId: "health",
      categoryTitle: "Health",
      categoryImage: "assets/images/health.png",
      categoryBackgroundColor: const Color(0xFFED1E79),
    ),
    CategoryData(
      categoryId: "business",
      categoryTitle: "Buisness",
      categoryImage: "assets/images/business.png",
      categoryBackgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryData(
      categoryId: "enviroment",
      categoryTitle: "Enviroment",
      categoryImage: "assets/images/enviroment.png",
      categoryBackgroundColor: const Color(0xFF4882CF),
    ),
    CategoryData(
      categoryId: "science",
      categoryTitle: "Science",
      categoryImage: "assets/images/science.png",
      categoryBackgroundColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: selectedCategory != null && isSearching
              ? TextField(
                  controller: searchController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => setState(() {}),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      selectedCategory == null
                          ? S.of(context).homeTitle
                          : selectedCategory!.categoryTitle,
                      style: theme.textTheme.titleLarge,
                    ),
                    if (selectedCategory != null) ...[
                      const SizedBox(width: 110),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearching = !isSearching;
                            if (!isSearching) searchController.clear();
                          });
                        },
                        child: const Icon(Icons.search,
                            color: Colors.white, size: 28),
                      ),
                    ]
                  ],
                ),
        ),
        drawer: CustomDrawer(
          onItemClicked: onCategoryDrawerClicked,
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: const Color(0xFF4F5A69)),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(20.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9 / 11,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) => CategoryItem(
                          categoryData: categories[index],
                          index: index,
                          onItemClick: onItemClicked,
                        ),
                        itemCount: categories.length,
                      ),
                    )
                  ],
                ),
              )
            : NewsView(
                categoryData: selectedCategory!,
                searchQuery: searchController.text,
              ),
      ),
    );
  }

  onItemClicked(CategoryData categoryData) {
    selectedCategory = categoryData;
    setState(() {});
  }

  onCategoryDrawerClicked() {
    selectedCategory = null;
    searchController.clear();
    isSearching = false;
    Navigator.pop(context);
    setState(() {});
  }
}

class CategoryData {
  final String categoryId;
  final String categoryTitle;
  final String categoryImage;
  final Color categoryBackgroundColor;

  const CategoryData({
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryImage,
    required this.categoryBackgroundColor,
  });
}
