import 'package:flutter/material.dart';
import 'package:islamy_app/app_theme.dart';
import 'package:islamy_app/assets.dart';
import 'package:islamy_app/sura_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/sura_model.dart';
import '../providers/l_d_mode.dart';

class QuraanScreen extends StatelessWidget {
  List<String> surahVerses = [
    "7", // Al-Fatiha
    "286", // Al-Baqarah
    "200", // Aal-E-Imran
    "176", // An-Nisa'
    "120", // Al-Ma'idah
    "165", // Al-An'am
    "206", // Al-A'raf
    "75", // Al-Anfal
    "129", // At-Tawbah
    "109", // Yunus
    "123", // Hud
    "111", // Yusuf
    "43", // Ar-Ra'd
    "52", // Ibrahim
    "99", // Al-Hijr
    "128", // An-Nahl
    "111", // Al-Isra'
    "110", // Al-Kahf
    "98", // Maryam
    "135", // Ta-Ha
    "112", // Al-Anbiya'
    "78", // Al-Hajj
    "118", // Al-Mu'minun
    "64", // An-Nur
    "77", // Al-Furqan
    "227", // Ash-Shu'ara'
    "93", // An-Naml
    "88", // Al-Qasas
    "69", // Al-Ankabut
    "60", // Ar-Rum
    "34", // Luqman
    "30", // As-Sajda
    "73", // Al-Ahzab
    "54", // Saba'
    "45", // Fatir
    "83", // Ya-Sin
    "182", // As-Saffat
    "88", // Sad
    "75", // Az-Zumar
    "85", // Ghafir
    "54", // Fussilat
    "53", // Ash-Shura
    "89", // Az-Zukhruf
    "59", // Ad-Dukhan
    "37", // Al-Jathiya
    "35", // Al-Ahqaf
    "38", // Muhammad
    "29", // Al-Fath
    "18", // Al-Hujraat
    "45", // Qaf
    "60", // Adh-Dhariyat
    "49", // At-Tur
    "62", // An-Najm
    "55", // Al-Qamar
    "78", // Ar-Rahman
    "96", // Al-Waqi'a
    "29", // Al-Hadid
    "22", // Al-Mujadila
    "24", // Al-Hashr
    "13", // Al-Mumtahina
    "14", // As-Saff
    "11", // Al-Jumu'a
    "11", // Al-Munafiqun
    "18", // At-Taghabun
    "12", // At-Talaq
    "12", // At-Tahrim
    "30", // Al-Mulk
    "52", // Al-Qalam
    "52", // Al-Haaqqa
    "44", // Al-Ma'arij
    "28", // Nuh
    "28", // Al-Jinn
    "20", // Al-Muzzammil
    "56", // Al-Muddaththir
    "40", // Al-Qiyama
    "31", // Al-Insan
    "50", // Al-Mursalat
    "40", // An-Naba'
    "46", // An-Nazi'at
    "42", // Abasa
    "29", // At-Takwir
    "19", // Al-Infitar
    "36", // Al-Mutaffifin
    "25", // Al-Inshiqaq
    "22", // Al-Buruj
    "17", // At-Tariq
    "19", // Al-Ala
    "26", // Al-Ghashiyah
    "30", // Al-Fajr
    "20", // Al-Balad
    "15", // Ash-Shams
    "21", // Al-Lail
    "11", // Adh-Dhuha
    "8", // Ash-Sharh
    "8", // At-Tin
    "19", // Al-Alaq
    "5", // Al-Qadr
    "8", // Al-Bayyina
    "8", // Az-Zalzalah
    "11", // Al-Adiyat
    "11", // Al-Qari'a
    "8", // At-Takathur
    "3", // Al-Asr
    "9", // Al-Humazah
    "5", // Al-Fil
    "4", // Quraish
    "7", // Al-Ma'un
    "3", // Al-Kawthar
    "6", // Al-Kafirun
    "3", // An-Nasr
    "5", // Al-Masad
    "4", // Al-Ikhlas
    "5", // Al-Falaq
    "6", // An-Nas
  ];

  @override
  Widget build(BuildContext context) {
    List<String> suraNames = [
      AppLocalizations.of(context)!.surahAlFatiha,
      AppLocalizations.of(context)!.surahAlBaqara,
      AppLocalizations.of(context)!.surahAaliImran,
      AppLocalizations.of(context)!.surahAnNisa,
      AppLocalizations.of(context)!.surahAlMaeda,
      AppLocalizations.of(context)!.surahAlAnam,
      AppLocalizations.of(context)!.surahAlAraf,
      AppLocalizations.of(context)!.surahAlAnfal,
      AppLocalizations.of(context)!.surahAtTawbah,
      AppLocalizations.of(context)!.surahYunus,
      AppLocalizations.of(context)!.surahHud,
      AppLocalizations.of(context)!.surahYusuf,
      AppLocalizations.of(context)!.surahIbrahim,
      AppLocalizations.of(context)!.surahAlHijr,
      AppLocalizations.of(context)!.surahAnNahl,
      AppLocalizations.of(context)!.surahAlIsra,
      AppLocalizations.of(context)!.surahAlKahf,
      AppLocalizations.of(context)!.surahMaryam,
      AppLocalizations.of(context)!.surahTaHa,
      AppLocalizations.of(context)!.surahAlAnbiya,
      AppLocalizations.of(context)!.surahAlHajj,
      AppLocalizations.of(context)!.surahAlMuminun,
      AppLocalizations.of(context)!.surahAnNur,
      AppLocalizations.of(context)!.surahAlFurqan,
      AppLocalizations.of(context)!.surahAshShuara,
      AppLocalizations.of(context)!.surahAnNaml,
      AppLocalizations.of(context)!.surahAlQasas,
      AppLocalizations.of(context)!.surahAlAnkabut,
      AppLocalizations.of(context)!.surahArRum,
      AppLocalizations.of(context)!.surahLuqman,
      AppLocalizations.of(context)!.surahAsSajda,
      AppLocalizations.of(context)!.surahAlAhzab,
      AppLocalizations.of(context)!.surahSaba,
      AppLocalizations.of(context)!.surahFatir,
      AppLocalizations.of(context)!.surahYaSeen,
      AppLocalizations.of(context)!.surahAsSaffat,
      AppLocalizations.of(context)!.surahSad,
      AppLocalizations.of(context)!.surahAzZumar,
      AppLocalizations.of(context)!.surahGhafir,
      AppLocalizations.of(context)!.surahFussilat,
      AppLocalizations.of(context)!.surahAshShura,
      AppLocalizations.of(context)!.surahAzZukhruf,
      AppLocalizations.of(context)!.surahAdDukhan,
      AppLocalizations.of(context)!.surahAjJathiya,
      AppLocalizations.of(context)!.surahAlAhqaf,
      AppLocalizations.of(context)!.surahMuhammad,
      AppLocalizations.of(context)!.surahAlFath,
      AppLocalizations.of(context)!.surahAlHujraat,
      AppLocalizations.of(context)!.surahQaf,
      AppLocalizations.of(context)!.surahAdhDhariyat,
      AppLocalizations.of(context)!.surahAtTur,
      AppLocalizations.of(context)!.surahAnNajm,
      AppLocalizations.of(context)!.surahQamar,
      AppLocalizations.of(context)!.surahArRahman,
      AppLocalizations.of(context)!.surahAlWaqiaa,
      AppLocalizations.of(context)!.surahAlHadid,
      AppLocalizations.of(context)!.surahAlHashr,
      AppLocalizations.of(context)!.surahAlMumtahina,
      AppLocalizations.of(context)!.surahAsSaff,
      AppLocalizations.of(context)!.surahAlJumuaa,
      AppLocalizations.of(context)!.surahAlMunafiqun,
      AppLocalizations.of(context)!.surahAtTaghabun,
      AppLocalizations.of(context)!.surahAtTalaq,
      AppLocalizations.of(context)!.surahAtTahrim,
      AppLocalizations.of(context)!.surahAlMulk,
      AppLocalizations.of(context)!.surahAlQalam,
      AppLocalizations.of(context)!.surahAlHaqqah,
      AppLocalizations.of(context)!.surahAlMaarij,
      AppLocalizations.of(context)!.surahNuh,
      AppLocalizations.of(context)!.surahAlJinn,
      AppLocalizations.of(context)!.surahAlMuzzammil,
      AppLocalizations.of(context)!.surahAlMuddathir,
      AppLocalizations.of(context)!.surahAlQiyama,
      AppLocalizations.of(context)!.surahAlInsan,
      AppLocalizations.of(context)!.surahAlMursalat,
      AppLocalizations.of(context)!.surahAnNaba,
      AppLocalizations.of(context)!.surahAnNaziat,
      AppLocalizations.of(context)!.surahAbasa,
      AppLocalizations.of(context)!.surahAtTakwir,
      AppLocalizations.of(context)!.surahAlInfitar,
      AppLocalizations.of(context)!.surahAlMutaffifin,
      AppLocalizations.of(context)!.surahAlInshiqaq,
      AppLocalizations.of(context)!.surahAlBuruj,
      AppLocalizations.of(context)!.surahAtTariq,
      AppLocalizations.of(context)!.surahAlAla,
      AppLocalizations.of(context)!.surahAlGhashiya,
      AppLocalizations.of(context)!.surahAlFajr,
      AppLocalizations.of(context)!.surahAlBalad,
      AppLocalizations.of(context)!.surahAshShams,
      AppLocalizations.of(context)!.surahAlLail,
      AppLocalizations.of(context)!.surahAdhDhuha,
      AppLocalizations.of(context)!.surahAshSharh,
      AppLocalizations.of(context)!.surahAtTin,
      AppLocalizations.of(context)!.surahAlAlaq,
      AppLocalizations.of(context)!.surahAlQadr,
      AppLocalizations.of(context)!.surahAlBayyina,
      AppLocalizations.of(context)!.surahAzZalzala,
      AppLocalizations.of(context)!.surahAlAdiyat,
      AppLocalizations.of(context)!.surahAlQaria,
      AppLocalizations.of(context)!.surahAtTakathur,
      AppLocalizations.of(context)!.surahAlAsr,
      AppLocalizations.of(context)!.surahAlHumazah,
      AppLocalizations.of(context)!.surahAlFil,
      AppLocalizations.of(context)!.surahQuraish,
      AppLocalizations.of(context)!.surahAlMaaun,
      AppLocalizations.of(context)!.surahAlKawthar,
      AppLocalizations.of(context)!.surahAlKafiroon,
      AppLocalizations.of(context)!.surahAnNasr,
      AppLocalizations.of(context)!.surahAlMasad,
      AppLocalizations.of(context)!.surahAlIkhlas,
      AppLocalizations.of(context)!.surahAlFalaq,
      AppLocalizations.of(context)!.surahAnNas,
    ];

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
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * (21 / 870),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.islamy,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * (227 / 870),
                      width: MediaQuery.of(context).size.width * (205 / 412),
                      child: Image.asset(Assets().quraanLogo)),
                  Divider(
                    color: AppTheme.primaryColor,
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(AppLocalizations.of(context)!.numberOfVerses,
                          style: Theme.of(context).textTheme.bodySmall!),
                      Spacer(
                        flex: 2,
                      ),
                      Text(AppLocalizations.of(context)!.surahName,
                          style: Theme.of(context).textTheme.bodySmall!),
                      Spacer(),
                    ],
                  ),
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
                            Navigator.pushNamed(context, SurahPage.routeName,
                                arguments: SuraModel(suraNames[index], index));
                          },
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                surahVerses[index],
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                suraNames[index],
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      },
                      itemCount: suraNames.length,
                    ),
                  )
                ],
              ),
              Center(
                child: VerticalDivider(
                  indent: MediaQuery.of(context).size.height * (286 / 870),
                  thickness: 2,
                  color: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
