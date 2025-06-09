import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.084,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: context.width * 0.03,
        children: [
          _buildNavItem(context, 0, SvgAssets.home, context.loc.home),
          _buildNavItem(context, 1, SvgAssets.profile, context.loc.profile),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String icon, String label) {
    return InkWell(
      onTap: () => onTap(index),
      child: Container(
        width: context.width * 0.31,
        height: context.height * 0.048,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.white20OpacityColor,
              width: 1,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageUtil.svgAsset(
              svgName: icon,
              height: context.height * 0.03,
            ),
            SizedBox(width: context.width * 0.02),
            Text(
              label,
              style: TextStyleUtils.generalText(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
