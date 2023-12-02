import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData baseLightTheme = ThemeData.light(useMaterial3: false);
final ThemeData baseDarkTheme = ThemeData.dark(useMaterial3: false);
final TextTheme baseTextTheme = GoogleFonts.secularOneTextTheme();
final TextTheme baseLightTextTheme = baseTextTheme;
final TextTheme baseDarkTextTheme = baseTextTheme.copyWith(
  displayLarge: baseTextTheme.displayLarge?.copyWith(color: Colors.white),
  displayMedium: baseTextTheme.displayMedium?.copyWith(color: Colors.white),
  displaySmall: baseTextTheme.displaySmall?.copyWith(color: Colors.white),
  headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: Colors.white),
  headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: Colors.white),
  headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: Colors.white),
  titleLarge: baseTextTheme.titleLarge?.copyWith(color: Colors.white),
  titleMedium: baseTextTheme.titleMedium?.copyWith(color: Colors.white),
  titleSmall: baseTextTheme.titleSmall?.copyWith(color: Colors.white),
  bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: Colors.white),
  bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: Colors.white),
  bodySmall: baseTextTheme.bodySmall?.copyWith(color: Colors.white),
  labelLarge: baseTextTheme.labelLarge?.copyWith(color: Colors.white),
  labelMedium: baseTextTheme.labelMedium?.copyWith(color: Colors.white),
  labelSmall: baseTextTheme.labelSmall?.copyWith(color: Colors.white),
);

const seed = Color(0xff305055);

const MaterialColor kPrimarySwatch = MaterialColor(
  0xff77c9d4,
  <int, Color>{
    50: Color(0xff6bb5bf), //10%
    100: Color(0xff5fa1aa), //20%
    200: Color(0xff538d94), //30%
    300: Color(0xff47797f), //40%
    400: Color(0xff3c656a), //50%
    500: Color(0xff305055), //60%
    600: Color(0xff243c40), //70%
    700: Color(0xff18282a), //80%
    800: Color(0xff0c1415), //90%
    900: Color(0xff000000), //100%
  },
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF77c9d4),
  onPrimary: Colors.white,
  primaryContainer: Colors.white,
  onPrimaryContainer: Color(0xFF8EF2FF),
  secondary: Color(0xFF57BC90),
  onSecondary: Colors.white,
  secondaryContainer: Colors.white,
  onSecondaryContainer: Color(0xFF57BC90),
  tertiary: Color(0xFFF1B950),
  onTertiary: Colors.white,
  tertiaryContainer: Colors.white,
  onTertiaryContainer: Color(0xFFF1B950),
  error: Color(0xFFD83F87),
  errorContainer: Colors.white,
  onError: Colors.white,
  onErrorContainer: Color(0xFFD83F87),
  background: Color(0xFFE6E7E9),
  onBackground: Color(0xFF222222),
  surface: Color(0xFFE6E7E9),
  onSurface: Color(0xFF222222),
  surfaceVariant: Colors.white,
  onSurfaceVariant: Color(0xFF222222),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFFE6E7E9),
  inverseSurface: Color(0xFF222222),
  inversePrimary: Colors.white,
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4ED8E8),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF77c9d4),
  onPrimary: Color(0xFFD6E3FF),
  primaryContainer: Color(0xFF004F56),
  onPrimaryContainer: Color(0xFF77c9d4),
  secondary: Color(0xFF57BC90),
  onSecondary: Color(0xFFD6E3FF),
  secondaryContainer: Color(0xFF005137),
  onSecondaryContainer: Color(0xFF57BC90),
  tertiary: Color(0xFFF1B950),
  onTertiary: Colors.white,
  tertiaryContainer: Color(0xFF224290),
  onTertiaryContainer: Color(0xFFDBE1FF),
  error: Color(0xFFD83F87),
  errorContainer: Color(0xFF004F56),
  onError: Colors.white,
  onErrorContainer: Color(0xFFD6E3FF),
  background: Color(0xFF3A485A),
  onBackground: Color(0xFFD6E3FF),
  surface: Color(0xFF001B3D),
  onSurface: Color(0xFFD6E3FF),
  surfaceVariant: Colors.blueGrey,
  onSurfaceVariant: Color(0xFFBEC8CA),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFF001B3D),
  inverseSurface: Color(0xFFD6E3FF),
  inversePrimary: Color(0xFF006972),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4ED8E8),
);

IconThemeData appLightIconTheme =
    baseLightTheme.iconTheme.copyWith(color: lightColorScheme.secondary);

IconThemeData appDarkIconTheme =
    baseDarkTheme.iconTheme.copyWith(color: lightColorScheme.secondary);

CardTheme appLightCardTheme =
    baseLightTheme.cardTheme.copyWith(color: Colors.white);
CardTheme appDarkCardTheme =
    baseLightTheme.cardTheme.copyWith(color: const Color(0xA6505E6E));

ThemeData appLightTheme = baseLightTheme.copyWith(
    colorScheme: lightColorScheme,
    textTheme: baseLightTextTheme,
    iconTheme: appLightIconTheme,
    cardTheme: appLightCardTheme,
    scaffoldBackgroundColor: lightColorScheme.background);
ThemeData appDarkTheme = baseDarkTheme.copyWith(
    colorScheme: darkColorScheme,
    iconTheme: appDarkIconTheme,
    textTheme: baseDarkTextTheme,
    cardTheme: appDarkCardTheme,
    scaffoldBackgroundColor: darkColorScheme.background);
