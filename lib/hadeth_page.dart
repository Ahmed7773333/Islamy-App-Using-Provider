// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/models/hadeth_model.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'assets.dart';
import 'providers/l_d_mode.dart';

class HadethPage extends StatefulWidget {
  static const String routeName = "hadeth";
  const HadethPage({super.key});

  @override
  State<HadethPage> createState() => _HadethPageState();
}

class _HadethPageState extends State<HadethPage> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
        appBar: AppBar(),
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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      verses[index],
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
    String file =
        await rootBundle.loadString("assets/hadeth/h${index + 1}.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
