

import 'package:flutter/material.dart';


const seedColor = Color.fromARGB(255, 128, 172, 255);

class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    brightness: isDarkmode ? Brightness.dark : Brightness.light,

    listTileTheme: const ListTileThemeData(
      iconColor: seedColor,
    ),
    
  );

}