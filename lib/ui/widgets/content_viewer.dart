import 'package:flutter/material.dart';
import 'package:islami_project/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ContentViewer extends StatelessWidget {
  String contentTitle;
  String contentText;
  bool icShow = false;
  late ThemeProvider themeProvider;

  ContentViewer(
      {super.key,
      required this.contentTitle,
      required this.icShow,
      required this.contentText});

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(top: 40, left: 29, right: 29, bottom: 110),
      padding: const EdgeInsets.only(top: 40),
      child: ListView(children: [
        buildContentTitle(context),
        horizonLine(context),
        const SizedBox(
          height: 20,
        ),
        Text(
          contentText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ]),
    );
  }

  Row buildContentTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          contentTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          width: 20,
        ),
        icShow
            ? const Icon(
                Icons.play_circle_fill,
              )
            : const SizedBox.shrink()
      ],
    );
  }

  Container horizonLine(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 70,
        right: 70,
      ),
      color: Theme.of(context).primaryColor,
      height: 1.5,
    );
  }
}
