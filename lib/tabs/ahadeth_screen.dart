import 'package:flutter/material.dart';
import 'package:islamy_app/models/hadeth_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_theme.dart';
import '../assets.dart';
import '../hadeth_page.dart';
import '../providers/l_d_mode.dart';

class AhadethScreen extends StatelessWidget {
  const AhadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            top: MediaQuery.of(context).size.height * (16 / 870),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.islamy,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * (219 / 870),
                  width: MediaQuery.of(context).size.width * (312 / 412),
                  child: Image.asset(Assets().ahadethLogo)),
              Divider(
                color: AppTheme.primaryColor,
                thickness: 2,
              ),
              Text(AppLocalizations.of(context)!.hadiths,
                  style: Theme.of(context).textTheme.bodyLarge!),
              Divider(
                color: AppTheme.primaryColor,
                thickness: 2,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    color: AppTheme.primaryColor,
                    indent: 40,
                    endIndent: 40,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HadethPage.routeName,
                            arguments: HadethModel(index));
                      },
                      child: Center(
                        child: Text(
                          '${AppLocalizations.of(context)!.hadithNumber} ${index + 1}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    );
                  },
                  itemCount: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
