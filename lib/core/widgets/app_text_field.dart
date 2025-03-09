// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

const double WIDTH = 370;
const double HEIGHT = 42;

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    required this.hint,
    this.insideHint,
    this.maxWidth,
    this.maxHeight,
    this.textStyle,
    this.fillColor,
    this.isObscured,
    this.isMultiline = false,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.readOnly,
    this.validator,
    this.initialValue,
    this.onSaved,
    this.onChanged,
    this.numeric,
    this.withRequiredAsterisk = false,
    this.minLines = 1,
    this.maxLength,
    this.maxLengthHintWidget,
    this.onTap,
    this.formatter,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String hint;
  final String? insideHint;
  final double? maxWidth;
  final double? maxHeight;
  final TextStyle? textStyle;
  final Color? fillColor;
  final bool? isObscured;
  final bool? isMultiline;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final String? initialValue;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onChanged;
  final bool? numeric;
  final bool withRequiredAsterisk;
  final int? minLines;
  final int? maxLength;
  final Widget? maxLengthHintWidget;
  final void Function()? onTap;
  final List<TextInputFormatter>? formatter;
  final TextInputType? keyboardType;

  const factory AppTextField.besideHint({
    Key? key,
    required String hint,
    String? insideHint,
    double? horizontalGap,
    TextEditingController? controller,
    double? maxWidth,
    double? maxHeight,
    TextStyle? textStyle,
    Color? fillColor,
    bool? isObscured,
    bool? isMultiline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? enabled,
    bool? readOnly,
    String? Function(String?)? validator,
    String? initialValue,
    void Function(String? value)? onSaved,
    void Function(String value)? onChanged,
    bool? numeric,
    bool withRequiredAsterisk,
    int? minLines,
    int? hintFlex,
    int? fieldFlex,
    int? maxLength,
    Widget? maxLengthHintWidget,
    TextInputType? keyboardType,
    List<TextInputFormatter>? formatter,
  }) = _TextFieldBesideHint;

  const factory AppTextField.outsideHint({
    Key? key,
    required String hint,
    String? insideHint,
    TextEditingController? controller,
    double? maxWidth,
    double? maxHeight,
    TextStyle? textStyle,
    Color? fillColor,
    bool? isObscured,
    bool? isMultiline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? enabled,
    bool? readOnly,
    String? Function(String?)? validator,
    String? initialValue,
    void Function(String? value)? onSaved,
    void Function(String value)? onChanged,
    bool? numeric,
    double? verticalGap,
    bool withRequiredAsterisk,
    int? minLines,
    int? maxLength,
    Widget? maxLengthHintWidget,
    void Function()? onTap,
    List<TextInputFormatter>? formatter,
    TextInputType? keyboardType,
  }) = _TextFieldWithOutsideHint;

  @override
  Widget build(BuildContext context) {
    return _buildTextFieldWithInsideHint(insideHint, context);
  }

  TextFormField _buildTextFieldWithInsideHint(
      String? hint, BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      inputFormatters: numeric ?? false
          ? formatter ??
              <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d{0,3})?$'))
              ]
          : null,
      onSaved: onSaved,
      initialValue: initialValue,
      style: AppTextStyles.signWithText,
      obscureText: isObscured ?? false,
      cursorHeight: 25,
      keyboardType: keyboardType,
      maxLines: isMultiline! ? 30 : 1,
      minLines: minLines,
      enabled: enabled,
      readOnly: readOnly ?? false,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.storeSizeItemColor),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        fillColor:
            enabled ?? true ? AppColors.white : AppColors.storeSizeItemColor,
        counter: maxLengthHintWidget,
        filled: true,
        hintStyle: textStyle ?? AppTextStyles.signWithText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.storeSizeItemColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.storeSizeItemColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? HEIGHT,
          maxWidth: maxWidth ?? WIDTH,
        ),
      ),
    );
  }
}

class _TextFieldBesideHint extends AppTextField {
  const _TextFieldBesideHint({
    super.key,
    super.controller,
    required super.hint,
    super.insideHint,
    super.maxWidth,
    super.maxHeight,
    super.textStyle,
    super.fillColor,
    super.isObscured,
    super.isMultiline,
    super.prefixIcon,
    super.suffixIcon,
    super.enabled,
    super.readOnly,
    super.validator,
    super.initialValue,
    super.onSaved,
    super.onChanged,
    super.numeric,
    super.withRequiredAsterisk,
    super.minLines,
    super.maxLength,
    super.maxLengthHintWidget,
    super.formatter,
    this.hintFlex,
    this.fieldFlex,
    this.horizontalGap,
    super.keyboardType,
  });

  final double? horizontalGap;
  final int? hintFlex;
  final int? fieldFlex;

  @override
  Widget build(BuildContext context) {
    return _buildTextField(context);
  }

  Row _buildTextField(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: hintFlex ?? 1,
          child: withRequiredAsterisk
              ? _buildTextWithAsterisk(context)
              : Text(
                  hint,
                  style: AppTextStyles.addedPetstext,
                ),
        ),
        SizedBox(width: horizontalGap ?? 10),
        Expanded(
          flex: fieldFlex ?? 3,
          child: _buildTextFieldWithInsideHint(insideHint, context),
        ),
      ],
    );
  }

  Row _buildTextWithAsterisk(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            hint,
            style: AppTextStyles.addedPetstext,
          ),
        ),
        const SizedBox(width: 5),
        _buildAsterisk(),
      ],
    );
  }

  Text _buildAsterisk() {
    return Text('*',
        style: TextStyle(
          color: AppColors.red.withOpacity(0.75),
          fontSize: 20,
        ));
  }
}

class _TextFieldWithOutsideHint extends AppTextField {
  const _TextFieldWithOutsideHint({
    super.key,
    super.controller,
    required super.hint,
    super.insideHint,
    super.maxWidth,
    super.maxHeight,
    super.textStyle,
    super.fillColor,
    super.isObscured,
    super.isMultiline,
    super.prefixIcon,
    super.suffixIcon,
    super.enabled,
    super.readOnly,
    super.validator,
    super.initialValue,
    super.onSaved,
    super.onChanged,
    super.numeric,
    super.withRequiredAsterisk,
    super.minLines,
    super.maxLength,
    super.maxLengthHintWidget,
    super.formatter,
    this.verticalGap,
    super.onTap,
    super.keyboardType,
  });

  final double? verticalGap;

  @override
  Widget build(BuildContext context) {
    return _buildTextField(context);
  }

  Column _buildTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        withRequiredAsterisk
            ? _buildTextWithAsterisk(context)
            : Text(
                hint,
                style: AppTextStyles.addedPetstext,
              ),
        SizedBox(height: verticalGap ?? 5),
        _buildTextFieldWithInsideHint(insideHint, context),
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
    return Text('*',
        style: TextStyle(
            color: AppColors.red.withOpacity(0.75), fontSize: 20, height: 0.5));
  }
}
