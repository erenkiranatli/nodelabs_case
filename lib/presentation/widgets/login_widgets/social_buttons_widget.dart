import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/button_utils.dart';

class SocialButtonsWidget extends StatelessWidget {
  const SocialButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.width * 0.021,
      children: [
        ButtonUtils().roundedSquareButton(
          iconPath: SvgAssets.google,
          onTap: () {},
        ),
        ButtonUtils().roundedSquareButton(
          iconPath: SvgAssets.apple,
          onTap: () {},
        ),
        ButtonUtils().roundedSquareButton(
          iconPath: SvgAssets.facebook,
          onTap: () {},
        ),
      ],
    );
  }
}
