// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class DialogExamplesScreen extends StatelessWidget {
  const DialogExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppDialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Show a success dialog
                AppDialog().showAppDialog(
                  context,
                  title: 'Success!',
                  bodyText: 'Your action was successful.',
                  dialogType: DialogType.success,
                  onConfirm: () {
                    print('Confirmed!');
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text('Show Success Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show an error dialog
                AppDialog().showAppDialog(
                  context,
                  title: 'Error!',
                  bodyText: 'Something went wrong.',
                  dialogType: DialogType.error,
                  onConfirm: () {
                    print('Confirmed!');
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text('Show Error Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show an alert dialog
                AppDialog().showAppDialog(
                  context,
                  title: 'Alert!',
                  bodyText: 'This is a warning message.',
                  dialogType: DialogType.alert,
                  onConfirm: () {
                    print('Confirmed!');
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text('Show Alert Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show a general dialog
                AppDialog().showAppDialog(
                  context,
                  title: 'Info',
                  bodyText: 'This is a general information dialog.',
                  dialogType: DialogType.general,
                  onConfirm: () {
                    print('Confirmed!');
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text('Show General Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
