import 'package:flutter/material.dart';
import 'package:islami_project/ui/providers/theme_provider.dart';
import 'package:islami_project/utils/extensions.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late ThemeProvider themeProvider;
  int currentIndex = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    List<String> tasbeehContent = [
      context.localization.sobhanAllah,
      context.localization.alhamdToAllah,
      context.localization.thereIsNoGodButAllah
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildSebhaPhoto(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                context.localization.numberOfTasbehat,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            buildNumberContainer(),
            buildSebhaClick(tasbeehContent)
          ],
        ),
      ],
    );
  }

  Stack buildSebhaPhoto() {
    return Stack(alignment: Alignment.topCenter, children: [
      Padding(
          padding: const EdgeInsets.only(top: 76),
          child: Image.asset(themeProvider.sebhaBody)),
      Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset(themeProvider.sebhaHead)),
    ]);
  }

  Container buildNumberContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      alignment: Alignment.center,
      width: 69,
      height: 81,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        "$count",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  ElevatedButton buildSebhaClick(List<String> tasbeehContent) {
    return ElevatedButton(
      onPressed: () {
        count++;
        if (count == 33) {
          count = 0;
          currentIndex = (currentIndex + 1) % 3;
        }

        setState(() {});
      },
      child: Text(
        tasbeehContent[currentIndex],
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
