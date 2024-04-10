import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';

final ThemeData votingAppTheme = _votingAppTheme();

ThemeData _votingAppTheme () {
  final ThemeData base = ThemeData.light();
  useMaterial3: true;

  return base.copyWith (
    colorScheme: base.colorScheme.copyWith(
      primary: const Color(0xFF5AC7F0), //priamry blue
      onPrimary: Colors.white, //color of text and icons that are located on the primary blue
      secondary: const Color(0xFFC7E7F3), //secondary blue
      onSecondary: const Color(0xFF113143),
      tertiary: const Color(0xFF113143), //dark blue
      onTertiary: Colors.white,
     ),
   );
}

TextTheme _votignAppTextTheme(TextTheme base) => base.copyWith(
// This'll be our appbars title
      displayLarge: base.displayLarge!.copyWith( //large title
          fontFamily: "Roboto",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF113143)),

// for widgets heading/title
      displayMedium: base.displayMedium!.copyWith( //med sized title
        fontFamily: "Roboto",
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF113143),
      ),

// for sub-widgets heading/title
      displaySmall: base.displaySmall!.copyWith( //small sized title (button)
        fontFamily: "Roboto",
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF113143),
      ),

// for widgets contents/paragraph
      bodyLarge: base.bodyLarge!.copyWith( // i dont think this is used ever, can default to displaySmall
          fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF113143)
          ),

// for sub-widgets contents/paragraph
      bodyMedium: base.bodyMedium!.copyWith( //regular body text
          fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF113143)
          ),

      bodySmall: base.bodySmall!.copyWith( //small thin text (i dont think this is used ever)
          fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.w200,
          color: const Color(0xFF113143)
          ),
    );

InputDecorationTheme _inputTheme(InputDecorationTheme base) => //inputs
    const InputDecorationTheme(
// Label color for the input widget
      labelStyle: TextStyle(color: Colors.black),
// Define border of input form while focused on
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );

ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color?>(const Color(0xFF5AC7F0)),
      ),
    );

SwitchThemeData _switchTheme(SwitchThemeData base) =>
  SwitchThemeData(
    
  );

//ListTileThemeData _listTileTheme(ListTileThemeData base) =>
  //ListTileThemeData(child: child);

DropdownMenuThemeData _dropDownTheme(DropdownMenuThemeData) =>
  DropdownMenuThemeData();

ToggleButtonsThemeData _toggleButtonTheme(ToggleButtonsThemeData) =>
  ToggleButtonsThemeData ();

//no textfield theme?
