import 'package:flutter/material.dart';
import 'package:islamy_app/app_theme.dart';
import 'package:islamy_app/tabs/ahadeth_screen.dart';
import 'package:islamy_app/tabs/quraan_screen.dart';
import 'package:islamy_app/tabs/sebha_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'assets.dart';
import 'providers/l_d_mode.dart';
import 'tabs/radio_screen.dart';
import 'tabs/setting_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const String routeName = "BottomBar";

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Widget> _pages = [
    QuraanScreen(),
    const AhadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const SettingsScreen(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundcolor = Provider.of<ThemeProvider>(context).isDarkMode
        ? const Color(0xff141A2E)
        : AppTheme.primaryColor;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: AppTheme.primaryColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: ImageIcon(AssetImage(Assets().quraanTab)),
            label: AppLocalizations.of(context)!.quran,
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: ImageIcon(AssetImage(Assets().ahadethTab)),
            label: AppLocalizations.of(context)!.hadiths,
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: ImageIcon(AssetImage(Assets().sebhaTab)),
            label: AppLocalizations.of(context)!.rosary,
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: ImageIcon(AssetImage(Assets().radioTab)),
            label: AppLocalizations.of(context)!.radio,
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
