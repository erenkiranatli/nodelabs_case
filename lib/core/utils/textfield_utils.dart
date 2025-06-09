import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/size_const.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';

class TextFieldUtils {
  Widget appTextfield({
    required String labelText,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    void Function(String)? onChanged,
    String? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.white10OpacityColor,
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          minLines: null,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          maxLines: obscureText ? 1 : null,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: SizeConst.width * 0.05, right: SizeConst.width * 0.05, top: SizeConst.height * 0.020, bottom: SizeConst.height * 0.020),
            isDense: true,
            prefixIconConstraints: BoxConstraints(),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(left: SizeConst.width * 0.056, right: SizeConst.width * 0.01),
                    child: ImageUtil.svgAsset(
                      svgName: prefixIcon,
                      height: SizeConst.height * 0.018,
                    ),
                  )
                : null,
            suffixIconConstraints: BoxConstraints(),
            suffixIcon: suffixIcon,
            labelStyle: TextStyleUtils.generalText(fontSize: 13, color: AppColors.opacityTextColor, fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: AppColors.white20OpacityColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: AppColors.white20OpacityColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: AppColors.white20OpacityColor, width: 1),
            ),
            labelText: labelText,
          ),
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
