import 'package:flutter/material.dart';
import 'package:islamy_app/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../assets.dart';
import '../providers/l_d_mode.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color IconColor = Provider.of<ThemeProvider>(context).isDarkMode
        ? Color(0xffFACC1D)
        : AppTheme.primaryColor;
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
              SizedBox(
                height: MediaQuery.of(context).size.height * (173 / 870),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * (222 / 870),
                  width: MediaQuery.of(context).size.width * (412 / 412),
                  child: Image.asset(Assets().radios)),
              SizedBox(
                height: MediaQuery.of(context).size.height * (57 / 870),
              ),
              Text(
                AppLocalizations.of(context)!.quranRadio,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (57 / 870),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: IconColor,
                      size: 40,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      color: IconColor,
                      size: 40,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: IconColor,
                      size: 40,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
