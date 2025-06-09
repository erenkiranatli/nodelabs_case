import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/constants/route_constant.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/button_utils.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/snackbar_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';
import 'package:nodelabs_case/core/utils/textfield_utils.dart';
import 'package:nodelabs_case/main.dart';
import 'package:nodelabs_case/presentation/viewmodels/register_viewmodel/register_viewmodel.dart';
import 'package:nodelabs_case/presentation/widgets/login_widgets/social_buttons_widget.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                context.go(RouteConstants.main);
              } else if (state is AuthError) {
                logger.error(state.message);
                SnackbarUtils.show(
                  context,
                  context.loc.warning,
                  state.message,
                );
              }
            },
            child: Consumer<RegisterViewModel>(builder: (context, vm, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    Text(
                      context.loc.welcome,
                      style: TextStyleUtils.generalText(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    SizedBox(
                      width: context.width * 0.7,
                      child: Text(
                        context.loc.welcomeBody,
                        style: TextStyleUtils.generalText(fontSize: 13, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: context.height * 0.05, left: context.width * 0.097, right: context.width * 0.097),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFieldUtils().appTextfield(
                            labelText: context.loc.fullName,
                            controller: vm.fullNameController,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            prefixIcon: SvgAssets.name,
                          ),
                          SizedBox(
                            height: context.height * 0.015,
                          ),
                          TextFieldUtils().appTextfield(
                            labelText: context.loc.mail,
                            controller: vm.emailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {},
                            prefixIcon: SvgAssets.mail,
                          ),
                          SizedBox(
                            height: context.height * 0.015,
                          ),
                          TextFieldUtils().appTextfield(
                            labelText: context.loc.password,
                            controller: vm.passwordController,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            prefixIcon: SvgAssets.lock,
                            obscureText: vm.isObscurePassword,
                            suffixIcon: InkWell(
                              overlayColor: WidgetStatePropertyAll(Colors.transparent),
                              onTap: () {
                                vm.toggleObscurePassword();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: context.width * 0.062),
                                child: ImageUtil.svgAsset(
                                  svgName: vm.isObscurePassword ? SvgAssets.hide : SvgAssets.unhide,
                                  height: context.height * 0.021,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.015,
                          ),
                          TextFieldUtils().appTextfield(
                            labelText: context.loc.rePass,
                            controller: vm.repasswordController,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            prefixIcon: SvgAssets.lock,
                            obscureText: vm.isObscureRePassword,
                            suffixIcon: InkWell(
                              overlayColor: WidgetStatePropertyAll(Colors.transparent),
                              onTap: () {
                                vm.toggleObscureRePassword();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: context.width * 0.062),
                                child: ImageUtil.svgAsset(
                                  svgName: vm.isObscureRePassword ? SvgAssets.hide : SvgAssets.unhide,
                                  height: context.height * 0.021,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.025,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ButtonUtils().richTextButton(
                              startText: context.loc.userAgreementStart,
                              clickableText: context.loc.userAgreementClickable,
                              endText: context.loc.userAgreementEnd,
                              onTap: () {},
                              underline: true,
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.025,
                          ),
                          ButtonUtils().defaultElevatedButton(
                            text: context.loc.registerNow,
                            onTap: () {
                              try {
                                vm.validateInputs();
                                context.read<AuthBloc>().add(
                                      RegisterEvent(
                                        vm.emailController.text.trim(),
                                        vm.passwordController.text,
                                        vm.fullNameController.text,
                                      ),
                                    );
                              } catch (e) {
                                SnackbarUtils.show(context, context.loc.warning, e.toString());
                              }
                            },
                          ),
                          SizedBox(
                            height: context.height * 0.03,
                          ),
                          SocialButtonsWidget(),
                          SizedBox(
                            height: context.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(context.loc.alreadyHaveAccount, style: TextStyleUtils.generalText(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.opacityTextColor)),
                              ButtonUtils().textButton(
                                text: "${context.loc.login}!",
                                onTap: () {
                                  context.go(RouteConstants.login);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
