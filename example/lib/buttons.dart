// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

/// Example screen to demonstrate all possible ways to use `CSButton` and `CSIconButton`.
class ButtonExamplesScreen extends StatelessWidget {
  const ButtonExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Examples'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Standard Positive Button
          Text(
            '1. Standard Positive Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSButton(
            title: 'Submit',
            onTap: () {
              print('Submit button tapped!');
            },
            type: ButtonType.positive,
          ),
          SizedBox(height: 16),

          // Standard Negative Button
          Text(
            '2. Standard Negative Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSButton(
            title: 'Delete',
            onTap: () {
              print('Delete button tapped!');
            },
            type: ButtonType.negative,
          ),
          SizedBox(height: 16),

          // Disabled Button
          Text(
            '3. Disabled Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSButton(
            title: 'Disabled Button',
            isDisabled: true,
            onTap: () {
              print('This button is disabled!');
            },
          ),
          SizedBox(height: 16),

          // Busy Button
          Text(
            '4. Busy Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSButton(
            title: 'Busy Button',
            isBusy: true,
            onTap: () {
              print('This button is busy!');
            },
          ),
          SizedBox(height: 16),

          // Outlined Positive Button
          Text(
            '5. Outlined Positive Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSButton.outline(
            title: 'Outlined Button',
            onTap: () {
              print('Outlined button tapped!');
            },
          ),
          SizedBox(height: 16),

          // Outlined Negative Button
          Text(
            '6. Outlined Negative Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSButton.outline(
            title: 'Outlined Negative',
            onTap: () {
              print('Outlined negative button tapped!');
            },
            type: ButtonType.negative,
          ),
          SizedBox(height: 16),

          // Button with Leading Icon
          Text(
            '7. Button with Leading Icon',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSButton(
            title: 'Button with Icon',
            leading: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onTap: () {
              print('Button with icon tapped!');
            },
          ),
          SizedBox(height: 16),

          // Icon Button with Text
          Text(
            '8. Icon Button with Text',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSIconButton(
            icon: Icons.add,
            text: 'Add Item',
            onTap: () {
              print('Add button tapped!');
            },
          ),
          SizedBox(height: 16),

          // Icon Button without Text
          Text(
            '9. Icon Button without Text',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          CSIconButton(
            icon: Icons.settings,
            onTap: () {
              print('Settings button tapped!');
            },
          ),
        ],
      ),
    );
  }
}
