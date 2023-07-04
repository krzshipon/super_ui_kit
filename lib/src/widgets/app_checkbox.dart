import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text.dart';

class CsCheckbox extends GetView {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? title;

  const CsCheckbox(this.value, this.onChanged, {Key? key, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: controller.isDefault.value,
          onChanged: controller.onDefaultCheck,
          activeColor: Get.theme.colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        if (title != null) CSText(title ?? '')
      ],
    );
  }
}
