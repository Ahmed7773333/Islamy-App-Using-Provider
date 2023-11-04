import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets.dart';
import '../providers/l_d_mode.dart';
import '../providers/language.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color inactiveDark = const Color(0xFFFACC1D);
    Color activeLight = const Color(0xFFB7935F);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            Provider.of<ThemeProvider>(context).isDarkMode
                ? Assets().darkBackground
                : Assets().ligtBackground,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Spacer(
                  flex: 5,
                ),
                Text(
                  'Light',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Switch(
                  inactiveThumbColor: activeLight,
                  inactiveTrackColor: activeLight,
                  activeTrackColor: inactiveDark,
                  activeColor: inactiveDark,
                  value: Provider.of<ThemeProvider>(context).isDarkMode ||
                      // ignore: unrelated_type_equality_checks
                      MediaQuery.of(context).platformBrightness ==
                          ThemeData.dark(),
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
                const Spacer(),
                Text(
                  'Dark',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * (30 / 870),
            ),
            Row(
              children: [
                const Spacer(
                  flex: 4,
                ),
                Text(
                  'English',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Switch(
                  inactiveThumbColor: activeLight,
                  inactiveTrackColor: activeLight,
                  activeTrackColor: inactiveDark,
                  activeColor: inactiveDark,
                  value: Provider.of<LanguageProvider>(context, listen: false)
                          .appLocale ==
                      const Locale('ar'),
                  onChanged: (value) {
                    Provider.of<LanguageProvider>(context, listen: false)
                        .changeLanguage();
                  },
                ),
                const Spacer(),
                Text(
                  'عربي',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
