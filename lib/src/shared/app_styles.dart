import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Seed color for generating the color scheme
const seedColor = Color(0xff305055);

// MaterialColor for primary swatch
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

// Light ColorScheme
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
  surface: Color(0xFFE6E7E9),
  onSurface: Color(0xFF222222),
  surfaceContainerHighest: Colors.white,
  onSurfaceVariant: Color(0xFF222222),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFFE6E7E9),
  inverseSurface: Color(0xFF222222),
  inversePrimary: Colors.white,
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4ED8E8),
);

// Dark ColorScheme
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
  surface: Color(0xFF001B3D),
  onSurface: Color(0xFFD6E3FF),
  surfaceContainerHighest: Colors.blueGrey,
  onSurfaceVariant: Color(0xFFBEC8CA),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFF001B3D),
  inverseSurface: Color(0xFFD6E3FF),
  inversePrimary: Color(0xFF006972),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4ED8E8),
);

// Base TextTheme using Google Fonts
final TextTheme baseTextTheme = GoogleFonts.secularOneTextTheme();

// Light TextTheme
final TextTheme lightTextTheme = baseTextTheme.copyWith(
  labelLarge:
      baseTextTheme.labelLarge?.copyWith(color: const Color(0xFF8593A4)),
  labelMedium:
      baseTextTheme.labelMedium?.copyWith(color: const Color(0xFF8593A4)),
  labelSmall:
      baseTextTheme.labelSmall?.copyWith(color: const Color(0xFF8593A4)),
);

// Dark TextTheme
final TextTheme darkTextTheme = baseTextTheme.copyWith(
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
  labelLarge:
      baseTextTheme.labelLarge?.copyWith(color: const Color(0xFF8593A4)),
  labelMedium:
      baseTextTheme.labelMedium?.copyWith(color: const Color(0xFF8593A4)),
  labelSmall:
      baseTextTheme.labelSmall?.copyWith(color: const Color(0xFF8593A4)),
);

// Light IconTheme
final IconThemeData lightIconTheme =
    IconThemeData(color: lightColorScheme.secondary);

// Dark IconTheme
final IconThemeData darkIconTheme =
    IconThemeData(color: darkColorScheme.secondary);

// Light CardTheme
const CardTheme lightCardTheme = CardTheme(color: Colors.white);

// Dark CardTheme
const CardTheme darkCardTheme = CardTheme(color: Color(0xA6505E6E));

// Light Theme
final ThemeData appLightTheme = ThemeData(
  useMaterial3: false,
  colorScheme: lightColorScheme,
  textTheme: lightTextTheme,
  iconTheme: lightIconTheme,
  cardTheme: lightCardTheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: lightColorScheme.surface,
  ),
);

// Dark Theme
final ThemeData appDarkTheme = ThemeData(
  useMaterial3: false,
  colorScheme: darkColorScheme,
  textTheme: darkTextTheme,
  iconTheme: darkIconTheme,
  cardTheme: darkCardTheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: darkColorScheme.surface,
  ),
);
