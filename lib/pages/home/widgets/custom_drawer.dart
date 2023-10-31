import 'package:flutter/material.dart';
import 'package:news_app/pages/setting/setting_view.dart';

class CustomDrawer extends StatelessWidget {
  final Function onCategoryDrawer;

  const CustomDrawer({super.key, required this.onCategoryDrawer});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.width * 0.7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: mediaQuery.width * 0.7,
            height: mediaQuery.width * 0.33,
            color: theme.primaryColor,
            child: Text("News App!",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          GestureDetector(
            onTap: () {
              onCategoryDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 38,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingView.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 38,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
