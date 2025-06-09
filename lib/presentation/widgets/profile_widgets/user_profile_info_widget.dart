import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/route_constant.dart';
import 'package:nodelabs_case/core/constants/size_const.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/button_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';
import 'package:nodelabs_case/presentation/blocs/auth_bloc/auth_bloc.dart';

class UserProfileInfoWidget extends StatelessWidget {
  const UserProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = (context.watch<AuthBloc>().state as AuthAuthenticated);

    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.04),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              authState.user.photoUrl,
              width: context.width * 0.15,
              height: context.width * 0.15,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: context.width * 0.15,
                height: context.width * 0.15,
                color: Colors.white.withValues(alpha: 0.5),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: SizeConst.width * 0.09,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: context.width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.3,
                child: Text(
                  authState.user.name,
                  style: TextStyleUtils.generalText(fontSize: 15),
                ),
              ),
              SizedBox(
                width: context.width * 0.3,
                child: Text(
                  authState.user.id,
                  style: TextStyleUtils.generalText(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white50OpacityColor),
                ),
              ),
            ],
          ),
          Spacer(),
          ButtonUtils().defaultElevatedButton(
            text: context.loc.addPhoto,
            width: context.width * 0.3,
            height: context.height * 0.04,
            fontWeight: FontWeight.w700,
            radius: 10,
            fontSize: 14,
            onTap: () {
              context.push(RouteConstants.addProfilePhoto);
            },
          ),
        ],
      ),
    );
  }
}
