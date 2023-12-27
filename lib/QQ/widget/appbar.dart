// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudyAppBar {
  static PreferredSizeWidget MyAppBar(String title, BuildContext context,
      {List<Widget>? actions,
      Key? key,
      Color? backgroundColor,
      Widget? leading,
      SystemUiOverlayStyle? systemOverlayStyle,
      double? leadingWidth,
      double? toolbarHeight,
      TextStyle? textStyle}) {
    backgroundColor ??= Theme.of(context).colorScheme.inversePrimary;
    return AppBar(
      key: key,
      leading: leading,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(title, style: textStyle),
      actions: actions,
      toolbarHeight: toolbarHeight,
      systemOverlayStyle: systemOverlayStyle,
      actionsIconTheme: const IconThemeData(size: 22),
      leadingWidth: leadingWidth,
    );
  }
}
