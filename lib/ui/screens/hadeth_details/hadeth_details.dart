import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/models/hadeth_detail_args.dart';
import 'package:islami_project/ui/widgets/content_viewer.dart';
import 'package:islami_project/ui/widgets/my_scaffold.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth details";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String hadethContent = "";
  String hadethName = "";

  @override
  Widget build(BuildContext context) {
    HadethDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as HadethDetailsArgs;
    if (hadethContent.isEmpty) ahadethContent(args.hadethFileName);
    return MyScaffold(
        body: hadethContent.isEmpty
            ? const CircularProgressIndicator()
            : ContentViewer(
                contentTitle: hadethName,
                icShow: false,
                contentText: hadethContent,
              ));
  }

  Future<void> ahadethContent(String fileName) async {
    hadethContent =
        await rootBundle.loadString("assets/files/hadeth/$fileName");
    List<String> hadethLinees = hadethContent.split("\n");
    hadethName = hadethLinees[0];
    hadethContent = hadethLinees[1];
    setState(() {});
  }
}
