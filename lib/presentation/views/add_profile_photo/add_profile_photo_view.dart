import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodelabs_case/core/constants/asset_constant.dart';
import 'package:nodelabs_case/core/constants/color_constant.dart';
import 'package:nodelabs_case/core/di/injection.dart';
import 'package:nodelabs_case/core/extensions/context_extensions.dart';
import 'package:nodelabs_case/core/utils/app_header_utils.dart';
import 'package:nodelabs_case/core/utils/button_utils.dart';
import 'package:nodelabs_case/core/utils/image_utils.dart';
import 'package:nodelabs_case/core/utils/loading_utils.dart';
import 'package:nodelabs_case/core/utils/text_style_utils.dart';
import 'package:nodelabs_case/presentation/viewmodels/add_profile_photo_viewmodel/add_profile_photo_viewmodel.dart';
import 'package:provider/provider.dart';

class AddProfilePhotoView extends StatelessWidget {
  const AddProfilePhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddProfilePhotoViewModel(locator()),
      child: Consumer<AddProfilePhotoViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      AppHeaderUtils().buildHeader(
                        title: context.loc.profileDetail,
                        onTap: () {
                          context.pop();
                        },
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Text(
                        context.loc.uploadPhoto,
                        style: TextStyleUtils.generalText(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: context.height * 0.005,
                      ),
                      Text(
                        context.loc.uploadPhotoBody,
                        style: TextStyleUtils.generalText(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      InkWell(
                        overlayColor: WidgetStatePropertyAll(Colors.transparent),
                        onTap: () async {
                          final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            viewModel.selectImage(pickedImage.path);
                          }
                        },
                        child: Container(
                          width: context.width * 0.4,
                          height: context.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.white10OpacityColor,
                            border: Border.all(
                              color: AppColors.white10OpacityColor,
                              width: 1.5,
                            ),
                          ),
                          child: viewModel.selectedImagePath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.file(
                                    File(viewModel.selectedImagePath!),
                                    width: context.width * 0.4,
                                    height: context.width * 0.4,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: ImageUtil.svgAsset(
                                    svgName: SvgAssets.plus,
                                    height: context.width * 0.07,
                                  ),
                                ),
                        ),
                      ),
                      Spacer(),
                      ButtonUtils().defaultElevatedButton(
                        width: context.width * 0.88,
                        text: context.loc.continueText,
                        onTap: () {
                          if (viewModel.selectedImagePath == null) {
                            return;
                          }
                          viewModel.uploadProfilePhoto(context);
                        },
                      ),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                    ],
                  ),
                  viewModel.isLoading ? LoadingUtils() : SizedBox()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
