import 'package:flutter/material.dart';
import 'package:islami_project/ui/providers/language_provider.dart';
import 'package:islami_project/ui/providers/theme_provider.dart';
import 'package:islami_project/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_project/ui/screens/surah_details/surah_details.dart';
import 'package:islami_project/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'ui/screens/home/home.dart';
import 'ui/screens/splash/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (context) => LanguageProvider(), child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    LanguageProvider languageProvider = Provider.of(context);
    return MaterialApp(
      theme: AppStyles.lightTheme,
      darkTheme: AppStyles.darkTheme,
      themeMode: themeProvider.currentTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: Locale(languageProvider.selectedLanguage),
      routes: {
        Splash.routeName: (_) => Splash(),
        Home.routeName: (_) => Home(),
        SurahDetails.routeName: (_) => const SurahDetails(),
        HadethDetails.routeName: (_) => const HadethDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
