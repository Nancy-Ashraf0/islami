import 'package:flutter/material.dart';
import 'package:islami_project/models/surah_detail_args.dart';
import 'package:islami_project/ui/screens/surah_details/surah_details.dart';
import 'package:islami_project/utils/app_consts.dart';
import 'package:islami_project/utils/extensions.dart';
import '../../../../../utils/app_assets.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranLogo)),
        Expanded(
          flex: 7,
          child: buildSurahNames(context),
        )
      ],
    );
  }

  Stack buildSurahNames(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            horizonLine(context),
            buildTitles(context),
            horizonLine(context),
            Expanded(
                child: ListView.builder(
              itemCount: AppConsts.suraName.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SurahDetails.routeName,
                      arguments: SurahDetailsArgs(
                          surahName: "سورة ${AppConsts.suraName[index]}",
                          surahFileName: "${index + 1}.txt"));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      AppConsts.suraName[index],
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "${AppConsts.versesNumber[index]}",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
            ))
          ],
        ),
        VerticalDivider(
          color: Theme.of(context).primaryColor,
          thickness: 1.5,
        ),
      ],
    );
  }

  Row buildTitles(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          context.localization.name,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        )),
        Expanded(
            child: Text(
          context.localization.versus,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }

  Container horizonLine(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 1.5,
    );
  }
}
