import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/core/theme/application_theme.dart';
import 'package:news_app/pages/home/home_view.dart';
import 'package:news_app/pages/setting/provider/LocaleProvider.dart';
import 'package:news_app/pages/setting/setting_view.dart';
import 'package:news_app/pages/splash/splash_view.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      themeMode: ThemeMode.light,
      locale: localeProvider.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeView.routeName: (context) => HomeView(),
        SettingView.routeName: (context) => SettingView(),
      },
    );
  }
}
