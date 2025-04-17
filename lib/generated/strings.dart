import 'package:intl/intl.dart';

class AppStrings {
  static String settingsTitle() =>
      Intl.message('Settings', name: 'settingsTitle');

  static String language() => Intl.message('Language', name: 'language');

  static String english() => Intl.message('English', name: 'english');

  static String arabic() => Intl.message('Arabic', name: 'arabic');

  static String homeTitle() => Intl.message('News App', name: 'homeTitle');

  static String categories() => Intl.message('Categories', name: 'categories');

  static String search() => Intl.message('Search', name: 'search');

  static String latestNews() => Intl.message('Latest News', name: 'latestNews');

  static String noNews() => Intl.message('No news found', name: 'noNews');

  static String retry() => Intl.message('Retry', name: 'retry');
}
