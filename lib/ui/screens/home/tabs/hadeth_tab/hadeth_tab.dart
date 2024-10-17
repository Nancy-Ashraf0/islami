import 'package:flutter/material.dart';
import 'package:islami_project/models/hadeth_detail_args.dart';
import 'package:islami_project/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_project/utils/extensions.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_consts.dart';

class HadethTab extends StatelessWidget {
  final List<String> hadeth = AppConsts.ahadeth.split("#");

  HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.hadethLogo)),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              horizonLine(context),
              Text(
                context.localization.ahadeth,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              horizonLine(context),
              Expanded(child: buildHadethListView())
            ],
          ),
        )
      ],
    );
  }

  ListView buildHadethListView() {
    return ListView.builder(
      itemCount: hadeth.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, HadethDetails.routeName,
              arguments:
                  HadethDetailsArgs(hadethFileName: "h${index + 1}.txt"));
        },
        child: Text(
          "${context.localization.hadethNum} ${index + 1}",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container horizonLine(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 1.5,
    );
  }
}
