import 'package:flutter/material.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/core/widgets/onboarding.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  DioHelper.init();
  await ChachHelper.init();
  runApp(
    Gluco(
      savedThemeMode: savedThemeMode,
    ),
  );
}

class Gluco extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const Gluco({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      debugShowFloatingThemeButton: true,
      builder: (theme, darkTheme) => MaterialApp(
        locale: Locale('ar'),
        supportedLocales: [
          Locale('en'), // الإنجليزية
          Locale('ar'), // العربية
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
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: const OnBoardingScreen(),
      ),
    );
  }
}
