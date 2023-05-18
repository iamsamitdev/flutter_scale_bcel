// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_scale/provider/app_locale.dart';
import 'package:flutter_scale/provider/theme_notifier.dart';
import 'package:flutter_scale/routers.dart';
import 'package:flutter_scale/themes/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var userID;
var locale;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Create shared_preferences Object
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  userID = sharedPreferences.getString('userID');

  // Set default language
  String? languageCode = sharedPreferences.getString('languageCode');

  locale = Locale(languageCode ?? 'en');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLocale(locale)),
        ChangeNotifierProvider(create: (_) => ThemeNotifier(AppTheme.lightTheme)),
      ],
      child: Consumer2<AppLocale, ThemeNotifier>(
        builder: (context, locale, theme, child) => MaterialApp(
          title: 'Flutter Scale',
          theme: theme.getTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale.locale,
          initialRoute: userID != null ? '/dashboard' : '/login',
          routes: routes,
        ),
      ),
    );
  }
}