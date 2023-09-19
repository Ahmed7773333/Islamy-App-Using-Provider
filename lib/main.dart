import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app_theme.dart';
import 'bottom_bar.dart';
import 'hadeth_page.dart';
import 'providers/counter.dart';
import 'providers/l_d_mode.dart';
import 'providers/language.dart';
import 'sura_page.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
      ],
      child: IslamyApp(),
    ),
  );
}

class IslamyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.appLocale,
      debugShowCheckedModeBanner: false,
      theme:
          themeProvider.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      initialRoute: BottomBarScreen.routeName,
      routes: {
        BottomBarScreen.routeName: (context) => BottomBarScreen(),
        SurahPage.routeName: (context) => SurahPage(),
        HadethPage.routeName: (context) => HadethPage(),
      },
    );
  }
}
