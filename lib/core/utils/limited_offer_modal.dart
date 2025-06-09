import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/size_const.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/services/localization_service.dart';
import 'package:nodelabs_case/core/utils/button_utils.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/inner_shadow_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';

class LimitedOfferModal {
  void showPremiumModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white.withValues(alpha: 0.1),
      builder: (context) => LimitedOfferModalView(),
    );
  }
}

class LimitedOfferModalView extends StatefulWidget {
  const LimitedOfferModalView({super.key});

  @override
  State<LimitedOfferModalView> createState() => _LimitedOfferModalViewState();
}

class _LimitedOfferModalViewState extends State<LimitedOfferModalView> {
  int selectedPackageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 6),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return InkWell(
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                onTap: () {
                  Navigator.pop(context);
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
                  child: Container(),
                ),
              );
            },
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: context.width * 0.042, right: context.width * 0.042),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: -context.height * 0.05,
                    child: ShadowRedEffect(
                      height: context.height * 0.3,
                      width: context.height * 0.3,
                      opacity: 0.41,
                    ),
                  ),
                  Positioned(
                    bottom: context.height * 0.03,
                    child: ShadowRedEffect(
                      height: context.height * 0.3,
                      width: context.height * 0.3,
                      opacity: 0.43,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: context.height * 0.025, bottom: context.height * 0.002),
                          child: Text(
                            context.loc.limitedOffer, 
                            style: TextStyleUtils.generalText(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                           context.loc.bonus_message,
                          textAlign: TextAlign.center,
                          style: TextStyleUtils.generalText(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.015,
                      ),
                      _buildBonuses(),
                      SizedBox(
                        height: context.height * 0.025,
                      ),
                      _buildPackages(),
                      SizedBox(
                        height: context.height * 0.025,
                      ),
                      ButtonUtils().defaultElevatedButton(
                        text:  context.loc.see_all_tokens,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: context.height * 0.033,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBonuses() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.white10OpacityColor,
          width: 1.5,
        ),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 2,
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.03),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeConst.height * 0.023, bottom: SizeConst.height * 0.013),
            child: Text(
              LocalizationService.current.bonuses_you_get,
              style: TextStyleUtils.generalText(fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bonusItem(1, LocalizationService.current.premium_account),
              _bonusItem(2, LocalizationService.current.more_matches),
              _bonusItem(3, LocalizationService.current.highlight),
              _bonusItem(4, LocalizationService.current.more_likes),
            ],
          ),
          SizedBox(
            height: SizeConst.height * 0.018,
          ),
        ],
      ),
    );
  }

  Widget _bonusItem(int index, String label) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ImageUtil.imageAsset(
              imageName: ImageAssets.bonusCircle,
              width: SizeConst.width * 0.14,
              height: SizeConst.width * 0.14,
            ),
            ImageUtil.imageAsset(
              imageName: "assets/images/bonus_$index.png",
              width: SizeConst.width * 0.08,
              height: SizeConst.width * 0.08,
            ),
          ],
        ),
        SizedBox(
          height: SizeConst.height * 0.01,
        ),
        Text(
          label,
          style: TextStyleUtils.generalText(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPackages() {
    return Column(
      children: [
        Center(
          child: Text(
            LocalizationService.current.choose_token_package,
            textAlign: TextAlign.center,
            style: TextStyleUtils.generalText(
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeConst.height * 0.035),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _packageItem("+10%", "200", "330", "₺99,99", 0),
              _packageItem("+70%", "2.000", "3.375", "₺799,99", 1),
              _packageItem("+35%", "1.000", "1.350", "₺399,99", 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _packageItem(String bonus, String oldJeton, String jeton, String price, int index) {
    final bool isSelected = selectedPackageIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPackageIndex = index;
        });
      },
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          InnerShadow(
            color: Colors.white.withValues(alpha: 0.5),
            offset: const Offset(1, 1),
            blur: 6,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: SizeConst.width * 0.27,
              height: SizeConst.height * 0.23,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.white.withValues(alpha: 0.4),
                ),
                gradient: RadialGradient(
                  center: Alignment.topLeft,
                  radius: 2,
                  colors: [
                    isSelected ? AppColors.blueColor : AppColors.darkRedColor,
                    AppColors.mainRedColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConst.height * 0.05,
                  ),
                  Text(
                    oldJeton,
                    style: TextStyleUtils.generalText(fontSize: 15, decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    jeton,
                    style: TextStyleUtils.generalText(fontSize: 25, height: 0, fontWeight: FontWeight.w900, fontFamily: TextStyleUtils.montserrat),
                  ),
                  Text(
                    LocalizationService.current.token,
                    style: TextStyleUtils.generalText(fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    price,
                    style: TextStyleUtils.generalText(fontSize: 15, fontWeight: FontWeight.w900, fontFamily: TextStyleUtils.montserrat),
                  ),
                  Text(
                    LocalizationService.current.weekly_per,
                    style: TextStyleUtils.generalText(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: SizeConst.height * 0.013,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -SizeConst.height * 0.0135,
            child: InnerShadow(
              color: Colors.white,
              offset: const Offset(1, 1),
              blur: 5,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: SizeConst.height * 0.027,
                width: SizeConst.width * 0.14,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.blueColor : AppColors.darkRedColor,
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.white,
                    ),
                    const BoxShadow(
                      color: AppColors.darkRedColor,
                      spreadRadius: -12,
                      blurRadius: 12,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    bonus,
                    style: TextStyleUtils.generalText(fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ShadowRedEffect extends StatelessWidget {
  final double width;
  final double height;
  double opacity = 1;

  ShadowRedEffect({
    super.key,
    required this.width,
    required this.height,
    this.opacity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE50914).withValues(alpha: opacity),
            blurRadius: 100,
            spreadRadius: 10,
            offset: const Offset(0, 0),
          )
        ],
      ),
    );
  }
}
