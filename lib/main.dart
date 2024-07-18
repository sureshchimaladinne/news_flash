
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsflash/views/home_screen.dart';
import 'package:newsflash/views/settings_view.dart';
import 'package:newsflash/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'models/localization_viewmodel.dart';
import 'models/local_strings.dart';
import 'models/localization_viewmodel.dart';
import 'models/theme_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => LocalizationViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeViewModel, LocalizationViewModel>(
      builder: (context, themeViewModel, localizationViewModel, child) {
        return GetMaterialApp(
          translations: LocaleString(),
          locale: localizationViewModel.locale,
          fallbackLocale: Locale('en', 'US'),
          supportedLocales: [
            Locale('en', 'US'),
            Locale('es', 'ES'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          themeMode: themeViewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: SplashScreen(),
          routes: {
            '/settings': (context) => SettingsView(),
          },
        );
      },
    );
  }
}

