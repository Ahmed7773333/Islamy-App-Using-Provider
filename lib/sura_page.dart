import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'assets.dart';
import 'models/sura_model.dart';
import 'providers/l_d_mode.dart';

class SurahPage extends StatefulWidget {
  static const String routeName = "surah";
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    // ignore: non_constant_identifier_names
    Color CardColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? const Color(0xff141A2E)
        : const Color(0xFFF8F8F8);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Assets().darkBackground
                    : Assets().ligtBackground,
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.height * (12 / 870)),
          child: Card(
            color: CardColor,
            elevation: 18,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: AppTheme.primaryColor)),
            child: Padding(
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.height * (8 / 870)),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  indent: MediaQuery.of(context).size.width * (40 / 412),
                  endIndent: MediaQuery.of(context).size.width * (40 / 412),
                  thickness: 1,
                  color: AppTheme.primaryColor,
                ),
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      '${verses[index]}\n${NumberFormat('#,###', 'ar_AE').format(index + 1)}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                },
                itemCount: verses.length,
              ),
            ),
          ),
        ),
      ),
    );
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString("assets/quraan/${index + 1}.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
