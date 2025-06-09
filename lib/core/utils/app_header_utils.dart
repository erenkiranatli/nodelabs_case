import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/size_const.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';

class AppHeaderUtils {
  Widget buildHeader({
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConst.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: SizeConst.width * 0.35,
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                overlayColor: WidgetStateColor.transparent,
                onTap: onTap,
                child: Container(
                  margin: EdgeInsets.only(left: SizeConst.width * 0.06),
                  height: SizeConst.height * 0.05,
                  width: SizeConst.height * 0.05,
                  decoration: BoxDecoration(
                    color: AppColors.white10OpacityColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white20OpacityColor,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: ImageUtil.svgAsset(
                      svgName: SvgAssets.back,
                      height: SizeConst.height * 0.025,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConst.width * 0.3,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyleUtils.generalText(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: SizeConst.width * 0.35,
            child: Padding(
              padding: EdgeInsets.only(right: SizeConst.width * 0.06),
              child: Align(
                alignment: Alignment.centerRight,
                child: trailing ?? SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
