import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static const black = Color(0xff000000);

  static const white = Color(0xFFFFFFFF);

  // dark

  static const double symmetricHozPadding = 15.0;

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColors.primaryLight,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.primaryLight,
      onPrimary: Colors.white,
      secondary: CustomColors.secondaryLight,
      onSecondary: Colors.white,
      error: CustomColors.red,
      onError: CustomColors.white,
      surface: CustomColors.white,
      onSurface: CustomColors.primaryLight,

      // background: Colors.grey[200]!,
      // onBackground: Colors.black,
    ),
    textSelectionTheme: TextSelectionThemeData(
        selectionColor: CustomColors.primaryLight.withOpacity(0.1),
        cursorColor: CustomColors.primaryLight,
        selectionHandleColor: CustomColors.primaryLight),
    fontFamily: GoogleFonts.lato().fontFamily,
    extensions: <ThemeExtension<dynamic>>[
      CustomThemeExtension(
          successColor: CustomColors.green,
          warningColor: CustomColors.orange,
          errorColor: CustomColors.red,
          backGroundColor: Color.fromARGB(255, 244, 255, 255)),
    ],
    // Additional customization
    appBarTheme: const AppBarTheme(
      // color: Colors.cyan,
      iconTheme: IconThemeData(color: CustomColors.white),
      titleTextStyle: TextStyle(color: CustomColors.white, fontSize: 20),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CustomColors.white, // StatusBar background color
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    // Define other necessary themes as needed...

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: black,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      displayMedium: TextStyle(
        color: black,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      displaySmall: TextStyle(
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        color: black,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: black,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.5,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: black,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        color: black,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        height: 1.3,
        letterSpacing: 0.4,
      ),
      labelSmall: TextStyle(
        color: black,
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
        height: 1.4,
        letterSpacing: 1.5,
      ),
    ),
  );

  // Dark theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: CustomColors.primaryDark,
    scaffoldBackgroundColor: CustomColors.scaffoldBackgroundDark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: CustomColors.primaryDark,
      onPrimary: CustomColors.onPrimaryDark,
      secondary: CustomColors.white,
      onSecondary: CustomColors.black,
      error: CustomColors.red,
      onError: CustomColors.black,
      surface: CustomColors.surfaceDark,
      onSurface: CustomColors.white,
    ),

    textSelectionTheme: TextSelectionThemeData(
        selectionColor: black.withOpacity(0.4),
        cursorColor: white,
        selectionHandleColor: white),

    extensions: <ThemeExtension<dynamic>>[
      CustomThemeExtension(
        successColor: CustomColors.lightGreen,
        warningColor: CustomColors.deepOrange,
        errorColor: CustomColors.redAccent,
        backGroundColor: Color(0xFFe2f3f3),
      ),
    ],
    // Additional customization
    appBarTheme: const AppBarTheme(
      color: CustomColors.primaryDark,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:
            CustomColors.scaffoldBackgroundDark, // StatusBar background color
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    // Define other necessary themes as needed...

    // primaryColor: Colors.grey[900],
    // extensions: <ThemeExtension<dynamic>>[
    //   CustomThemeExtension(
    //     successColor: Colors.black,
    //     warningColor: Colors.orange,
    //     errorColor: Colors.red,
    //   ),
    // ],
    // brightness: Brightness.dark,
    // scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      displayMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      displaySmall: TextStyle(
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.5,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: white,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        height: 1.3,
        letterSpacing: 0.4,
      ),
      labelSmall: TextStyle(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
        height: 1.4,
        letterSpacing: 1.5,
      ),
    ),
  );

  // Additional custom theme can be added here
}
