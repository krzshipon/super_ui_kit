import 'package:flutter/material.dart';

class CsIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double? size;
  final void Function()? onTap;

  const CsIcon(this.icon, {super.key, this.onTap, this.color, this.size});
  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        return InkWell(
          splashColor: Theme.of(context).colorScheme.primary.withAlpha(45),
          onTap: onTap,
          child: Icon(
            icon,
            color: color,
            size: size,
          ),
        );
      });
}
