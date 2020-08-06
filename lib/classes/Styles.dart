import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Styles {
  //colors
//  static const Color whiteColor = Color(0xffffffff);
//  static const Color blackColor = Color(0xff0000000);
//  static const Color orangeColor = Colors.orange;
//  static const Color redColor = Colors.red;
//  static const Color darkRedColor = Color(0xFFB71C1C);
//
//  static const Color purpleColor = Color(0xff5E498A);
//
//  static const Color darkThemeColor = Color(0xff33333E);
//
//  static const Color grayColor = Color(0xff797979);
//
//  static const Color greyColorLight = Color(0xffd7d7d7);
//
//  static const Color settingsBackground = Color(0xffefeff4);
//
//  static const Color settingsGroupSubtitle = Color(0xff777777);
//
//  static const Color iconBlue = Color(0xff0000ff);
//  static const Color transparent = Colors.transparent;
//  static const Color iconGold = Color(0xffdba800);
//  static const Color bottomBarSelectedColor = Color(0xff5e4989);
//
//  //Strings
//  static const TextStyle defaultTextStyle = TextStyle(
//    color: Styles.purpleColor,
//    fontSize: 20.0,
//  );
//  static const TextStyle defaultTextStyleBlack = TextStyle(
//    color: Styles.blackColor,
//    fontSize: 20.0,
//  );
//  static const TextStyle defaultTextStyleGRey = TextStyle(
//    color: Styles.grayColor,
//    fontSize: 20.0,
//  );
//  static const TextStyle smallTextStyleGRey = TextStyle(
//    color: Styles.grayColor,
//    fontSize: 16.0,
//  );
//  static const TextStyle smallTextStyle = TextStyle(
//    color: Styles.purpleColor,
//    fontSize: 16.0,
//  );
//  static const TextStyle smallTextStyleWhite = TextStyle(
//    color: Styles.whiteColor,
//    fontSize: 16.0,
//  );
//  static const TextStyle smallTextStyleBlack = TextStyle(
//    color: Styles.blackColor,
//    fontSize: 16.0,
//  );
//  static const TextStyle defaultButtonTextStyle =
//      TextStyle(color: Styles.whiteColor, fontSize: 20);
//
//  static const TextStyle profileTextStyleBlack = TextStyle(
//    color: Styles.blackColor,
//    fontSize: 20.0,
//  );
//
//  static const TextStyle defaultTextStyleWhite = TextStyle(
//    color: Styles.whiteColor,
//    fontSize: 20.0,
//  );
//  static const TextStyle messageRecipientTextStyle = TextStyle(
//      color: Styles.blackColor, fontSize: 16.0, fontWeight: FontWeight.bold);

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      //* Custom Google Font
      //  fontFamily: Devfest.google_sans_family,
      cursorColor: Colors.blue,
      //textTheme: TextTheme(title: TextStyle(color: isDarkTheme ? Colors.white : Colors.black),),

      primarySwatch: Colors.blue,
      unselectedWidgetColor: isDarkTheme ? Colors.white : Colors.black,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      accentColor: isDarkTheme ? Colors.white : Colors.black,
      backgroundColor: isDarkTheme ? Colors.grey[900] : Color(0xffF1F5FB),
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Colors.blueGrey : Colors.blue,
      dividerColor: isDarkTheme ? Colors.grey[800] : Colors.grey[300],
      hintColor: isDarkTheme ? Colors.grey : Colors.black54,

      highlightColor: Colors.blue,
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Colors.grey : Colors.blue,
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      // primaryIconTheme: IconThemeData(color: Colors.grey),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),

      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
