import 'package:flutter/material.dart';
import 'package:islami_project/utils/extensions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.transparent,
    title: Text(
      context.localization.islami,
      style: AppStyles.appBarStyle,
    ),
  );
}
