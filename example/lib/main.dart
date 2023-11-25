// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appLightTheme,
      home: const MyHomePage(title: 'Super Ui Kit Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          verticalSpaceMedium,
          CSHeader(
            headerType: HeaderType.home,
            title: "Example App",
            trailing: CSIconButton(
              icon: Get.theme.brightness == Brightness.light
                  ? Icons.light_mode_sharp
                  : Icons.dark_mode_sharp,
              onTap: () => _toggleTheme(),
            ),
          ),
          verticalSpaceRegular,
          CSItemHeader(title: "Item Header:"),
          CSDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CSText.display("Display"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CSText.headline("Headline"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CSText.title("Title"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CSText("Normal Text"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CSText.label("Label"),
            ],
          ),
          verticalSpaceSmall,
          CSItemHeader(title: "Item Header:"),
          CSDivider(),
          verticalSpaceSmall,
          CSCard(
            children: [
              CSText("General Card"),
            ],
          ),
          verticalSpaceSmall,
          CSItemHeader(title: "Item Header:"),
          CSDivider(),
          verticalSpaceSmall,
          CsSettingItem(
            iconData: Icons.settings,
            title: "Settings Item",
          ),
          verticalSpaceSmall,
          CSItemHeader(title: "Item Header:"),
          CSDivider(),
          verticalSpaceSmall,
          CSButton(title: "Positive Filled Button"),
          verticalSpaceSmall,
          CSItemHeader(title: "Item Header:"),
          CSDivider(),
          verticalSpaceSmall,
          CSButton.outline(title: "Positive Outlined Button"),
          verticalSpaceSmall,
          CSItemHeader(title: "Item Header:"),
          CSDivider(),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CSTupleText(
                text1: "Tuple",
                text2: "Text",
              ),
            ],
          ),
          verticalSpaceRegular,
          CSFileSelector(),
          // CSDropDown(
          //   ["Item 1", "Item 2"],
          //   value: "Item 1",
          // ),
        ],
      ),
    );
  }
}
