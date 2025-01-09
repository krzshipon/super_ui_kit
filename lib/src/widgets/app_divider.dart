import 'package:flutter/material.dart';

class CSDivider extends StatelessWidget {
  const CSDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      color: Theme.of(context).disabledColor,
    );
  }
}
