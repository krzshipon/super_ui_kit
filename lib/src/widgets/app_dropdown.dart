import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/app_colors.dart';
import '../shared/app_ui_helpers.dart';
import 'app_cards.dart';
import 'app_input_field.dart';
import 'app_text.dart';

class CSDropDown extends StatelessWidget {
  static const kSelectionInstruction = 'Please Select';
  static const kOtherSelection = 'Other';

  final cornerRadius = 10.0;
  final String? error;
  final String? header;
  final void Function(String?)? onValueChange;
  final List<String> items;
  final Function()? onEdit;
  final TextEditingController? editingController;
  final String? value;

  const CSDropDown(
    this.items, {
    Key? key,
    this.error,
    this.header,
    this.onValueChange,
    this.onEdit,
    this.editingController,
    this.value,
  }) : super(key: key);

  List<DropdownMenuItem<String>> get dropdownItems {
    items.sort(((a, b) => a.compareTo(b)));
    List<DropdownMenuItem<String>> menuItems = items
        .map((item) => DropdownMenuItem(
              value: item,
              child: CSText(item),
            ))
        .toList();
    menuItems.insert(
        0,
        const DropdownMenuItem(
          value: kSelectionInstruction,
          child: CSText(kSelectionInstruction),
        ));
    menuItems.insert(
        menuItems.length,
        const DropdownMenuItem(
          value: kOtherSelection,
          child: CSText(kOtherSelection),
        ));
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (header != null)
          Padding(
            padding: EdgeInsets.only(left: cornerRadius),
            child: CSText.label(header!),
          ),
        Row(children: [
          Expanded(
            child: CSCard(
              margin: EdgeInsets.zero,
              children: [
                DropdownButtonFormField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  dropdownColor: kCardBackgroundColor,
                  value: value?.isEmpty ?? true
                      ? dropdownItems.first.value
                      : value ?? dropdownItems.first.value,
                  items: dropdownItems,
                  onChanged: onValueChange,
                ),
                if (error != null) verticalSpaceSmall,
                if (error != null)
                  CSText(
                    error!,
                    color: Get.theme.colorScheme.error,
                    textType: TextType.label,
                  ),
                if (editingController != null)
                  (error == null) ? verticalSpaceRegular : verticalSpaceSmall,
                if (editingController != null)
                  CSInputField(
                    controller: editingController!,
                    inputType: TextInputType.text,
                  ),
                (editingController != null)
                    ? verticalSpaceTiny
                    : (error == null)
                        ? verticalSpaceRegular
                        : verticalSpaceSmall
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
