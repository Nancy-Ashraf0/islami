import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/ui/widgets/my_scaffold.dart';
import '../../../models/surah_detail_args.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/content_viewer.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = "surah details";

  const SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  String surahContent = "";

  @override
  Widget build(BuildContext context) {
    SurahDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SurahDetailsArgs;
    if (surahContent.isEmpty) {
      readSurahContent(args.surahFileName);
    }
    return MyScaffold(
      body: surahContent.isEmpty
          ? const CircularProgressIndicator()
          : ContentViewer(
              contentTitle: args.surahName,
              icShow: true,
              contentText: surahContent,
            ),
    );
  }

  Future<void> readSurahContent(String fileName) async {
    surahContent = await rootBundle.loadString("assets/files/surah/$fileName");
    List<String> aya = surahContent.split("\n");
    for (int i = 0; i < aya.length; i++) {
      aya[i] = "${aya[i]}(${i + 1})";
    }
    surahContent = aya.join();

    setState(() {});
  }

  Container horizonLine() {
    return Container(
      margin: const EdgeInsets.only(
        left: 70,
        right: 70,
      ),
      color: AppColors.mainColor,
      height: 1.5,
    );
  }
}
