import 'package:flutter/material.dart';
import 'package:islami_project/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';
import 'app_bar.dart';

class MyScaffold extends StatelessWidget {
  Widget body;

  MyScaffold({super.key, required this.body});

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(themeProvider.mainBackground))),
        child: Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: buildAppBar(context),
            body: body));
  }
}
