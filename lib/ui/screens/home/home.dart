import 'package:flutter/material.dart';
import 'package:islami_project/ui/screens/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/extensions.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/app_bar.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItemIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
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
          bottomNavigationBar: buildBottomNavigationBar(context),
          appBar: buildAppBar(context),
          body: tabs[selectedItemIndex],
        ));
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: themeProvider.bottomNavigationBarBackground),
      child: BottomNavigationBar(
          iconSize: 40,
          onTap: onItemTab,
          items: [
            BottomNavigationBarItem(
                label: context.localization.quran,
                icon: const ImageIcon(AssetImage(AppAssets.icQuran))),
            BottomNavigationBarItem(
                label: context.localization.hadeth,
                icon: const ImageIcon(AssetImage(AppAssets.icHadeth))),
            BottomNavigationBarItem(
                label: context.localization.sebha,
                icon: const ImageIcon(AssetImage(AppAssets.icSebha))),
            BottomNavigationBarItem(
                label: context.localization.radio,
                icon: const ImageIcon(AssetImage(AppAssets.icRadio))),
            BottomNavigationBarItem(
                label: context.localization.settings,
                icon: const Icon(Icons.settings)),
          ],
          currentIndex: selectedItemIndex,
          selectedItemColor: themeProvider.bottomNavigationBarSelectedItem),
    );
  }

  onItemTab(int index) {
    selectedItemIndex = index;
    setState(() {});
  }
}
