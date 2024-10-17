import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/extensions.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AssetImage(AppAssets.radioImage)),
        Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 10),
          child: Text(
            context.localization.quranRadio,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            Icon(
              Icons.skip_next,
              color: Theme.of(context).primaryColor,
              size: 50,
            )
          ],
        )
      ],
    );
  }
}
