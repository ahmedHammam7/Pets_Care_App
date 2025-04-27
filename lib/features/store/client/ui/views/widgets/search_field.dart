import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.onchanged});

  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey,
        child: TextField(
          onChanged: onchanged,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
            hintText: "Search Keywords...",
            fillColor: AppColors.textFieldColor,
            filled: true,
            prefixIconColor: AppColors.primaryColor,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
