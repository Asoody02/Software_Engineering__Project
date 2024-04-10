import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final ThemeData customTheme = ThemeData(
  // Define colors
  primaryColor: const Color(0xFF5AC7F0), //main blue
  primaryColorLight: Color(0xFFC7E7F3), //light blue
  primaryColorDark: const Color(0xFF113143), //dark blue
  scaffoldBackgroundColor: Colors.white,

  // Define typography
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: "Roboto",
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF113143)
    ),
    displayMedium: TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF113143),
    ),
    displaySmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF113143),
    ),
    bodyLarge: TextStyle(
     fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF113143),
    ),
    bodyMedium: TextStyle(
        fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF113143),
    ),
    labelLarge: TextStyle( //for buttons
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: Colors.white,
    ),
  ),

  // Define button theme
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF5AC7F0),
    textTheme: ButtonTextTheme.normal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

 
  // Define card theme
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  // Define dialog theme
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  // Define text button theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.blue),
    ),
  ),

  // Define elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),

  // Define outlined button theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(color: Colors.blue),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),

  // Define switch theme
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white; // White color for the thumb when the switch is on
      }

      return Colors.grey; // Grey color for the thumb when the switch is off
    }),

    trackColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFF5AC7F0); // White color for the track(bg) when the switch is on
      }

      return const Color.fromARGB(255, 211, 211, 211); // Grey color for the track (bg) when the switch is off
    }),
    overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
  ),
);
