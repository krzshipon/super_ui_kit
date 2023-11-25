import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class CSTupleText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;

  const CSTupleText(
      {Key? key, required this.text1, required this.text2, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          CSText(
            text1,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CSText(
            " $text2",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          )
        ]));
  }
}
