import 'package:flutter/material.dart';

import '../home_view.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;
  final int index;
  final Function onItemClick;

  const CategoryItem({
    super.key,
    required this.categoryData,
    required this.index,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onItemClick(categoryData);
      },
      child: Container(
        decoration: BoxDecoration(
            color: categoryData.categoryBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomRight: index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(25),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(categoryData.categoryImage),
            Text(
              categoryData.categoryTitle,
              style: theme.textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}