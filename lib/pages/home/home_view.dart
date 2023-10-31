import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("News App"),
        ),
        body: Container(),
        drawer: CustomDrawer(),
      ),
    );
  }
}
