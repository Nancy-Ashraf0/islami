import 'package:flutter/material.dart';
import 'package:islami_project/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../home/home.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";
  late ThemeProvider themeProvider;

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, Home.routeName);
      },
    );
    return Scaffold(
      body: Image.asset(themeProvider.splash),
    );
  }
}
