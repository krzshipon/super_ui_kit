import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import 'buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super UI Kit Demo',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(toggleTheme: _toggleTheme),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  const MyHomePage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super UI Kit Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Buttons',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CSButton(
              title: 'Buttons',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ButtonExamplesScreen()),
              ),
            ),
            const SizedBox(height: 10),
            CSButton.outline(
              title: 'Outlined Button',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Text('Dropdown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CSDropDown(
              ['Option 1', 'Option 2', 'Option 3'],
              onValueChange: (value) {},
            ),
            const SizedBox(height: 20),
            const Text('Cards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CSCard(
              children: [
                const CSText('This is a card'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('File Selector',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CSFileSelector(
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Text('Profile Item',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CSProfileItem(
              iconData: Icons.person,
              title: 'Profile Item',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Text('Setting Item',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CsSettingItem(
              iconData: Icons.settings,
              title: 'Setting Item',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Text(
              'Address Item',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CSAddressItem(
              CsAddress(
                name: 'John Doe',
                mobile: '1234567890',
                division: 'Division',
                city: 'City',
                area: 'Area',
                addressLine: 'Address Line',
                label: 'HOME',
                isDefault: true,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
