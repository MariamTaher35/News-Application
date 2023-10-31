import 'package:flutter/material.dart';
import 'package:news_app/core/theme/application_theme.dart';
import 'package:news_app/pages/home/home_view.dart';
import 'package:news_app/pages/setting/setting_view.dart';
import 'package:news_app/pages/splash/splash_view.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        SettingView.routeName: (context) => const SettingView(),
        HomeView.routeName: (context) => const HomeView(),
      },
    );
  }
}
