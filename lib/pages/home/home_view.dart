import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/category_item.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';
import 'package:news_app/pages/home/widgets/news_details_view.dart';

import '../../models/category_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> catrgories = [
    CategoryModel(
        CategoryId: "sports",
        CategoryTitle: "Sports",
        CategoryImage: "assets/images/sport.png",
        CategoryColor: Color(0xFFC91C22)),
    CategoryModel(
        CategoryId: "politics",
        CategoryTitle: "Politics",
        CategoryImage: "assets/images/politics.png",
        CategoryColor: Color(0xFF003E90)),
    CategoryModel(
        CategoryId: "health",
        CategoryTitle: "Health",
        CategoryImage: "assets/images/health.png",
        CategoryColor: Color(0xFFED1E79)),
    CategoryModel(
        CategoryId: "business",
        CategoryTitle: "Business",
        CategoryImage: "assets/images/business.png",
        CategoryColor: Color(0xFFCF7E48)),
    CategoryModel(
        CategoryId: "environment",
        CategoryTitle: "Environment",
        CategoryImage: "assets/images/enviroment.png",
        CategoryColor: Color(0xFF4882CF)),
    CategoryModel(
        CategoryId: "science",
        CategoryTitle: "Science",
        CategoryImage: "assets/images/science.png",
        CategoryColor: Color(0xFFF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(selectedCategory == null
              ? "News App"
              : selectedCategory!.CategoryTitle),
        ),
        drawer: CustomDrawer(
          onCategoryDrawer: onDrawerCategoryClicked,
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
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Color(0xFF4F5A69),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 9 / 11),
                        itemBuilder: (context, index) => CategoryItem(
                          categoryModel: catrgories[index],
                          index: index,
                          onItemClick: oncategoryItemClick,
                        ),
                        itemCount: catrgories.length,
                      ),
                    )
                  ],
                ),
              )
            : NewsDetailsView(
                categoryModel: selectedCategory!,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  oncategoryItemClick(CategoryModel categoryModel) {
    print(categoryModel.CategoryId);
    selectedCategory = categoryModel;
    setState(() {});
  }

  onDrawerCategoryClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
