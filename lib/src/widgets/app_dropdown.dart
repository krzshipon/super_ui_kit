import 'package:flutter/material.dart';
import 'package:super_ui_kit/src/shared/app_sizes.dart';

import '../shared/app_ui_helpers.dart';
import 'app_cards.dart';
import 'app_input_field.dart';
import 'app_text.dart';

/// A customizable dropdown widget with support for error handling, headers, and optional text input.
///
/// This widget combines a dropdown menu with optional error messages, headers, and an input field
/// for custom selections. It integrates seamlessly with the app's theme and provides a consistent
/// design for dropdowns.
class CSDropDown extends StatelessWidget {
  /// The instruction text displayed as the first item in the dropdown.
  /// Default: `'Please Select'`.
  final String selectionInstruction;

  /// The text displayed as the last item in the dropdown for custom selections.
  /// Default: `'Other'`.
  final String otherSelection;

  /// The corner radius of the dropdown card.
  /// Default: `10.0`.
  final double cornerRadius;

  /// The error message to display below the dropdown.
  /// Optional.
  final String? error;

  /// The header text displayed above the dropdown.
  /// Optional.
  final String? header;

  /// Callback function triggered when the dropdown value changes.
  final void Function(String?)? onValueChange;

  /// The list of items to display in the dropdown.
  final List<String> items;

  /// Callback function triggered when the "Other" option is selected.
  /// Optional.
  final Function()? onEdit;

  /// Controller for the optional input field (used with the "Other" option).
  /// Optional.
  final TextEditingController? editingController;

  /// The currently selected value in the dropdown.
  /// Optional.
  final String? value;

  /// Whether the dropdown card should have a flat design (no elevation).
  /// Default: `false`.
  final bool isFlat;

  /// Creates a customizable dropdown widget.
  ///
  /// Parameters:
  /// - `items`: List of items to display in the dropdown.
  /// - `selectionInstruction`: Instruction text displayed as the first item.
  /// - `otherSelection`: Text displayed as the last item for custom selections.
  /// - `error`: Error message to display below the dropdown.
  /// - `header`: Header text displayed above the dropdown.
  /// - `onValueChange`: Callback function triggered when the dropdown value changes.
  /// - `onEdit`: Callback function triggered when the "Other" option is selected.
  /// - `editingController`: Controller for the optional input field.
  /// - `value`: Currently selected value in the dropdown.
  /// - `isFlat`: Whether the dropdown card should have a flat design.
  const CSDropDown(
    this.items, {
    Key? key,
    this.error,
    this.header,
    this.onValueChange,
    this.onEdit,
    this.editingController,
    this.value,
    this.selectionInstruction = 'Please Select',
    this.otherSelection = 'Other',
    this.isFlat = false,
  })  : cornerRadius = 10.0,
        super(key: key);

  /// Generates the list of dropdown menu items.
  ///
  /// Sorts the items alphabetically and adds the `selectionInstruction`
  /// and `otherSelection` options to the beginning and end of the list, respectively.
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
      DropdownMenuItem(
        value: selectionInstruction,
        child: CSText(selectionInstruction),
      ),
    );
    menuItems.insert(
      menuItems.length,
      DropdownMenuItem(
        value: otherSelection,
        child: CSText(otherSelection),
      ),
    );
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display the header if provided
        if (header != null)
          Padding(
            padding: EdgeInsets.only(left: cornerRadius),
            child: CSText.label(header!),
          ),
        Row(
          children: [
            Expanded(
              child: CSCard(
                margin: EdgeInsets.zero,
                elevation: isFlat ? 0 : kElevationLevelMedium,
                children: [
                  // Dropdown menu
                  DropdownButtonFormField(
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface, // Text color
                        ),
                    dropdownColor: Theme.of(context)
                        .colorScheme
                        .surface, // Dropdown background color
                    value: value?.isEmpty ?? true
                        ? dropdownItems.first.value
                        : value ?? dropdownItems.first.value,
                    items: dropdownItems,
                    onChanged: onValueChange,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .surface, // Background color
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .outline, // Border color
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .outline, // Border color when enabled
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // Border color when focused
                          width: 2,
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Dropdown icon color
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Rounded corners for dropdown menu
                    elevation: 2, // Elevation for dropdown menu
                    menuMaxHeight: 200, // Maximum height of the dropdown menu
                    isExpanded:
                        true, // Expands the dropdown to fill the available width
                    hint: Text(
                      selectionInstruction,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(150), // Hint text color
                          ),
                    ),
                  ),
                  // Display the error message if provided
                  if (error != null) verticalSpaceSmall,
                  if (error != null)
                    CSText(
                      error!,
                      color: theme.colorScheme.error,
                      textType: TextType.label,
                    ),
                  // Display the input field if the editing controller is provided
                  if (editingController != null)
                    (error == null) ? verticalSpaceRegular : verticalSpaceSmall,
                  if (editingController != null)
                    CSInputField(
                      controller: editingController!,
                      inputType: TextInputType.text,
                    ),
                  // Add spacing based on the presence of the error or input field
                  (editingController != null)
                      ? verticalSpaceTiny
                      : (error == null)
                          ? emptyWidget
                          : verticalSpaceSmall,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
