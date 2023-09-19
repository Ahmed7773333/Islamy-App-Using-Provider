import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_theme.dart';
import '../assets.dart';
import '../providers/counter.dart';
import '../providers/l_d_mode.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color IconColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? Color(0xffFACC1D)
        : AppTheme.primaryColor;
    Color containerColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? Color(0xFF141A2E)
        : AppTheme.primaryColor;
    String _verbs = Provider.of<Counter>(context).verbs;
    String _curruntVerb = Provider.of<Counter>(context).curruntVerb;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Assets().darkBackground
                    : Assets().ligtBackground,
              ),
              fit: BoxFit.fill)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * (20 / 870),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.islamy,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: MediaQuery.of(context).size.height * (350 / 870),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * (6 / 870),
                      left: MediaQuery.of(context).size.width * (85 / 412),
                      child: InkWell(
                        onTap: () {
                          Provider.of<Counter>(context, listen: false)
                              .increment(context);
                        },
                        child: Image.asset(
                          Assets().sebha,
                          color: IconColor,
                          width:
                              MediaQuery.of(context).size.width * (232 / 412),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * (20 / 870),
                      right: MediaQuery.of(context).size.width * (143 / 412),
                      child: Image.asset(
                        Assets().head,
                        color: IconColor,
                        width: MediaQuery.of(context).size.width * (73 / 412),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (43 / 870),
              ),
              Text(
                '${AppLocalizations.of(context)!.number}${_verbs}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (26 / 870),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * (69 / 412),
                height: MediaQuery.of(context).size.height * (87 / 870),
                decoration: ShapeDecoration(
                  color: containerColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  '${Provider.of<Counter>(context).count}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (22 / 870),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * (200 / 412),
                height: MediaQuery.of(context).size.height * (51 / 870),
                decoration: ShapeDecoration(
                  color: IconColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  _curruntVerb,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
