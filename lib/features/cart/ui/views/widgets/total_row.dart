import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalRow extends StatelessWidget {
  const TotalRow({
    super.key,
    required this.text1,
    required this.text2,
    this.textStyle,
  });
  final String text1, text2;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          Text(
            text1,
            style: textStyle,
          ),
          const Spacer(),
          Text(
            text2,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
