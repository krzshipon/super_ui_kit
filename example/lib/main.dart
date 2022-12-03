import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super UiKit',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.light,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: appBreakPoints,
      ),
      home: const MyHomePage(title: 'Super UiKit is OpenSource!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      child: Column(
        children: const [
          verticalSpaceMedium,
          CSHeader(
            title: 'Super Ui Kit',
            headerType: HeaderType.home,
          ),
          verticalSpaceMedium,
          CSText(
            'Welcome to Super UiKit!\nHead start to your app development with beautiful ui experience. No need to waste your time on desigining all from scratch',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
