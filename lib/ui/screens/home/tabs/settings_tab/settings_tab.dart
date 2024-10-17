import 'package:flutter/material.dart';
import 'package:islami_project/ui/providers/language_provider.dart';
import 'package:islami_project/ui/providers/theme_provider.dart';
import 'package:islami_project/utils/extensions.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late LanguageProvider provider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localization.language,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          buildDropdownButton(),
          const SizedBox(
            height: 20,
          ),
          buildThemeSwitch(context)
        ],
      ),
    );
  }

  Row buildThemeSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.theme,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Switch(
            activeColor: Theme.of(context).primaryColor,
            value: themeProvider.isDarkMode,
            onChanged: (newValue) {
              themeProvider.toggleTheme(newValue);
            }),
      ],
    );
  }

  Widget buildDropdownButton() {
    return DropdownButton(
        dropdownColor: Theme.of(context).primaryColorDark,
        isExpanded: true,
        value: provider.selectedLanguage,
        items: const [
          DropdownMenuItem<String>(value: "ar", child: Text("العربية")),
          DropdownMenuItem<String>(value: "en", child: Text("English"))
        ],
        onChanged: (newValue) {
          provider.setLangPrefs(newValue!);
          setState(() {});
        });
  }
}
