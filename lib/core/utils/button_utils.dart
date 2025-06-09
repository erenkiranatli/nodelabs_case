import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/size_const.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';

class ButtonUtils {
  Widget defaultElevatedButton({
    required String text,
    required VoidCallback onTap,
    double? width,
    double? height,
    Color color = AppColors.mainRedColor,
    Color textColor = Colors.white,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.w500,
    double radius = 18,
    Widget? leading,
  }) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? SizeConst.height * 0.062,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading ?? SizedBox(),
              Center(
                child: Text(
                  text,
                  style: TextStyleUtils.generalText(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget roundedSquareButton({
    required String iconPath,
    required VoidCallback onTap,
    double? size,
  }) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Container(
        width: SizeConst.height * 0.064,
        height: SizeConst.height * 0.064,
        decoration: BoxDecoration(
          color: AppColors.white10OpacityColor,
          border: Border.all(
            color: AppColors.white20OpacityColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: ImageUtil.svgAsset(
            svgName: iconPath,
            height: SizeConst.height * 0.025,
          ),
        ),
      ),
    );
  }

  Widget textButton({
    required String text,
    required VoidCallback onTap,
    Color textColor = Colors.white,
    double fontSize = 13,
    bool underline = false,
  }) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Text(
        text,
        style: TextStyleUtils.generalText(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          decoration: underline ? TextDecoration.underline : null,
        ),
      ),
    );
  }

  Widget richTextButton({
    String startText = "",
    required String clickableText,
    String endText = "",
    required VoidCallback onTap,
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
    Color? nonClickTextColor,
    double fontSize = 13,
    bool underline = false,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: startText,
            style: TextStyleUtils.generalText(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: nonClickTextColor ?? AppColors.opacityTextColor,
            ),
          ),
          TextSpan(
            text: clickableText,
            style: TextStyleUtils.generalText(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
              decoration: underline ? TextDecoration.underline : null,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          TextSpan(
            text: endText,
            style: TextStyleUtils.generalText(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: nonClickTextColor ?? AppColors.opacityTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
