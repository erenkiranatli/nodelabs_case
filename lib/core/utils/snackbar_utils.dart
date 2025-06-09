import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';

class SnackbarUtils {
  static void show(
    BuildContext context,
    String title,
    String body, {
    bool isError = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        content: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: AppColors.white50OpacityColor,
            width: 1,
          ))),
          child: Padding(
            padding: EdgeInsets.only(top: context.height * 0.01, bottom: context.height * 0.01),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.width * 0.04, right: context.width * 0.04),
                  child: ImageUtil.lottieAsset(lottieName: isError ? JsonAssets.warning : JsonAssets.info, height: context.height * 0.05, repeat: false),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width * 0.85 - context.height * 0.05,
                      child: Text(
                        title,
                        style: TextStyleUtils.generalText(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.85 - context.height * 0.05,
                      child: Text(
                        body,
                        style: TextStyleUtils.generalText(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.snackbarColor,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
