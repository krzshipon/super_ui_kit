// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:example/dialogs.dart';
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
      home: HomePage(toggleTheme: _toggleTheme),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  const HomePage({super.key, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final AppLoader _loader = AppLoader();
  bool _isChecked = false;
  final TextEditingController _controller = TextEditingController();

  void _simulateLoading() async {
    _loader.showLoader(context); // Show the loader
    await Future.delayed(const Duration(seconds: 3)); // Simulate a delay
    _loader.hideLoader(context); // Hide the loader
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super UI Kit Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with a back arrow and title
            CSHeader(
              title: 'Back Header',
              headerType: HeaderType.other,
              onLeftIconClick: () {
                print('Back icon clicked!');
                Navigator.of(context).pop();
              },
            ),
            verticalSpaceRegular,
            // Header with a home icon and title
            CSHeader(
              title: 'Home Header',
              headerType: HeaderType.home,
              onLeftIconClick: () {
                print('Home icon clicked!');
              },
            ),
            verticalSpaceRegular,
            // Header with a trailing widget
            CSHeader(
              title: 'Header with Trailing',
              trailing: CsIcon(
                Icons.settings,
              ),
            ),
            CSCard(
              onTap: () {
                print('Card tapped!');
              },
              onLongTap: () {
                print('Card long-pressed!');
              },
              cardType: CSCardType.item,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              radius: 12,
              elevation: 5,
              children: [
                const CsIcon(
                  Icons.star,
                  size: 50,
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome to Super UI Kit!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'This is an example of a customizable card widget.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            verticalSpaceRegular,
            const CSItemHeader(
              title: 'An item header',
            ),
            verticalSpaceTiny,
            CSInputField(
              controller: _controller,
              placeholder: 'Enter your name',
              leading: const CsIcon(Icons.person),
              trailing: const CsIcon(Icons.clear),
              trailingTapped: () {
                _controller.clear();
              },
            ),
            verticalSpaceRegular,
            CSButton(
              title: 'See Button Examples',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ButtonExamplesScreen()),
              ),
            ),
            verticalSpaceRegular,
            CSButton(
              title: 'See Dialog Examples',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DialogExamplesScreen()),
              ),
            ),
            verticalSpaceRegular,
            CSButton(
              title: 'Show Loader',
              onTap: () => _simulateLoading(),
            ),
            verticalSpaceRegular,
            const CSDivider(),
            Align(
                alignment: Alignment.center,
                child: CSText('Above & below are two dividers')),
            const CSDivider(),
            CsCheckbox(
              _isChecked,
              (newValue) {
                setState(() {
                  _isChecked = newValue ?? false;
                });
              },
              title: 'Accept Terms and Conditions',
            ),
            verticalSpaceRegular,
            const Text('Dropdown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CSDropDown(
              ['Option 1', 'Option 2', 'Option 3'],
              onValueChange: (value) {},
            ),
            verticalSpaceRegular,
            const Text('Profile Item',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            verticalSpaceTiny,
            CSProfileItem(
              iconData: Icons.person,
              title: 'Profile Item',
              onTap: () {},
            ),
            verticalSpaceRegular,
            const Text('Setting Item',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            verticalSpaceTiny,
            CsSettingItem(
              iconData: Icons.settings,
              title: 'Setting Item',
              onTap: () {},
            ),
            verticalSpaceRegular,
            const Text('File Selector',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            verticalSpaceTiny,
            CSFileSelector(
              onTap: () {},
            ),
            verticalSpaceRegular,
            const Text(
              'Address Item',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            verticalSpaceTiny,
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
            verticalSpaceRegular,
            CSText.display('Display Text'),
            CSText.headline('Headline Text'),
            CSText.title('Title Text'),
            CSText('Normal Text'),
            CSText.label('Label Text'),
            verticalSpaceRegular,
            CSTupleText(text1: 'Tuple', text2: 'Text'),
            verticalSpaceLarge
          ],
        ),
      ),
    );
  }
}
