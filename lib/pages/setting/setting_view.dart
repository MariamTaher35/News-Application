import 'package:flutter/material.dart';
import 'package:news_app/generated/l10n.dart'; // ✅ Import the localization file
import 'package:news_app/pages/setting/provider/LocaleProvider.dart';
import 'package:provider/provider.dart';

class SettingView extends StatelessWidget {
  static const String routeName = "setting";

  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale.languageCode;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFF39A552), // ✅ Green background
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    // You can open drawer or do something else
                    Navigator.pop(context); // Or open drawer if you use one
                  },
                ),
                SizedBox(width: 80),
                Text(
                  S.of(context).settingsTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).language, // ✅ Localized title
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  value: currentLocale,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(S.of(context).english,
                          style: const TextStyle(color: Colors.black)),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(S.of(context).arabic,
                          style: const TextStyle(color: Colors.black)),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      localeProvider.setLocale(Locale(value));
                    }
                  },
                  isExpanded: true,
                  underline: const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
