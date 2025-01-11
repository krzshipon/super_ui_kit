import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class CSTextExampleScreen extends StatelessWidget {
  const CSTextExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CSHeader(
                headerType: HeaderType.other,
                title: 'CSText Example',
              ),
              verticalSpaceRegular,
              // CSText Examples
              const CSText.display(
                'CSText Examples',
                fontSize: 24.0,
              ),
              const SizedBox(height: 16),
              const CSText.headline(
                'Headline Text',
                color: Colors.green,
                fontSize: 20.0,
              ),
              const SizedBox(height: 16),
              const CSText.title(
                'Title Text',
                color: Colors.orange,
                fontSize: 18.0,
              ),
              const SizedBox(height: 16),
              const CSText(
                'Body Text',
                textType: TextType.body,
                color: Colors.black,
                fontSize: 16.0,
              ),
              const SizedBox(height: 16),
              const CSText.label(
                'Label Text',
                color: Colors.grey,
                fontSize: 14.0,
              ),
              const SizedBox(height: 16),
              CSText(
                'Clickable Text',
                textType: TextType.body,
                color: Colors.purple,
                fontSize: 16.0,
                onTap: () {
                  print('Text tapped!');
                },
              ),
              const SizedBox(height: 32),
              // CSTupleText Examples
              const CSText.display(
                'CSTupleText Examples',
                fontSize: 24.0,
              ),
              const SizedBox(height: 16),
              const CSTupleText(
                text1: 'Text1',
                text2: 'Text2',
                style1: TextStyle(color: Colors.black),
                style2: TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 16),
              CSTupleText(
                text1: 'Status:',
                text2: 'Active',
                style1: const TextStyle(color: Colors.black),
                style2: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CSTupleText(
                text1: 'Click Me:',
                text2: 'Tap Here',
                style1: const TextStyle(color: Colors.black),
                style2: TextStyle(
                  color: Colors.purple,
                  decoration: TextDecoration.underline,
                ),
                onTap: () {
                  print('CSTupleText tapped!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
