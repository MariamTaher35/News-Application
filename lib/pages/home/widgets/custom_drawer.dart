import 'package:flutter/material.dart';
import 'package:news_app/pages/setting/setting_view.dart';

class CustomDrawer extends StatelessWidget {
  final Function onItemClicked;

  const CustomDrawer({
    super.key,
    required this.onItemClicked,
  });

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
            width: double.infinity,
            height: mediaQuery.height * 0.15,
            color: theme.primaryColor,
            child: Text("News App!", style: theme.textTheme.titleLarge),
          ),
          GestureDetector(
            onTap: () {
              onItemClicked();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Categories",
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SettingView.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Settings",
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
