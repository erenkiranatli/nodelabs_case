import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleUtils {
  static const String euclidCircularA = 'EuclidCircularA';
  static const String montserrat = 'Montserrat';

  static TextStyle generalText({
    required double fontSize,
    String fontFamily = euclidCircularA,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w500,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration? decoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize.sp,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      height: height,
      decorationColor: Colors.white,
    );
  }
}
