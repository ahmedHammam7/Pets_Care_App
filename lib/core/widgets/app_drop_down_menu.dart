import 'package:flutter/material.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class AppDropDownMenu<T> extends StatelessWidget {
  const AppDropDownMenu({
    super.key,
    required this.hint,
    required this.items,
    this.itemBuilder,
    this.onChanged,
    this.enabled,
    this.controller,
    this.initialSelection,
    this.onFilter,
    this.onFocused,
    this.horizontalGap,
    this.width,
    this.height,
    this.onSubmitted,
    this.outsideHint = false,
    this.withRequiredAsterisk = false,
  });

  final String hint;
  final List<T> items;
  final TextEditingController? controller;
  final DropdownMenuEntry<T> Function(int index)? itemBuilder;
  final void Function(String value)? onSubmitted;
  final void Function(T? vlaue)? onChanged;
  final bool? enabled;
  final T? initialSelection;
  final List<DropdownMenuEntry<T>> Function(List<DropdownMenuEntry<T>>, String)?
      onFilter;
  final void Function()? onFocused;
  final double? horizontalGap;
  final double? width;
  final double? height;
  final bool? outsideHint;
  final bool withRequiredAsterisk;

  @override
  Widget build(BuildContext context) {
    return outsideHint!
        ? _buildDropDownMenuWithOutsideHint(context)
        : _buildDropDownMenuWithInsideHint(context);
  }

  Widget _buildDropDownMenuWithInsideHint(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => DropdownMenu<T>(
        width: width ?? constraints.maxWidth,
        hintText: !outsideHint! ? hint : null,
        focusNode: FocusNode()..addListener(() => onFocused?.call()),
        initialSelection: initialSelection,
        controller: controller,
        dropdownMenuEntries: _getEntries(context),
        onSelected: onChanged,
        enableFilter: true,
        filterCallback: onFilter ?? _onFiltered,
        enabled: enabled ?? true,
        textStyle: AppTextStyles.addedPetstext,
        inputDecorationTheme: _buildDecorationTheme(),
        menuStyle: MenuStyle(
          fixedSize:
              WidgetStatePropertyAll(Size(width ?? constraints.maxWidth, 160)),
          backgroundColor: const WidgetStatePropertyAll(AppColors.white),
        ),
      ),
    );
  }

  Row _buildDropDownMenuWithOutsideHint(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: withRequiredAsterisk
              ? _buildTextWithAsterisk(context)
              : Text(
                  hint,
                  style: AppTextStyles.addedPetstext,
                ),
        ),
        SizedBox(width: horizontalGap ?? 10),
        Expanded(
          flex: 3,
          child: _buildDropDownMenuWithInsideHint(context),
        ),
      ],
    );
  }

  Row _buildTextWithAsterisk(BuildContext context) {
    return Row(
      children: [
        Text(
          hint,
          style: AppTextStyles.addedPetstext,
        ),
        const SizedBox(width: 5),
        _buildAsterisk(),
      ],
    );
  }

  Text _buildAsterisk() {
    return const Text('*',
        style: TextStyle(
          color: AppColors.red,
          fontSize: 20,
        ));
  }

  InputDecorationTheme _buildDecorationTheme() {
    return InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
      filled: true,
      fillColor: enabled ?? true ? AppColors.white : AppColors.primaryColor,
      constraints: BoxConstraints.tight(Size.fromHeight(height ?? 42)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
    );
  }

  List<DropdownMenuEntry<T>> _onFiltered(
      List<DropdownMenuEntry<T>> entries, String filter) {
    final filteredEntries = entries
        .where(
            (entry) => entry.label.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    return filteredEntries.isEmpty ? entries : filteredEntries;
  }

  List<DropdownMenuEntry<T>> _getEntries(BuildContext context) {
    return List.generate(items.length, (index) {
      return itemBuilder?.call(index) ??
          DropdownMenuEntry(
              value: items[index],
              label: items[index].toString(),
              labelWidget: Text(
                items[index].toString(),
                style: AppTextStyles.addedPetstext,
              ));
    });
  }
}
