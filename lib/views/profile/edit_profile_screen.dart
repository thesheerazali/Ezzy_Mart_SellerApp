import 'dart:io';

import 'package:ezzy_mart_seller_app/const/colors.dart';
import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/controllers/profile_controller.dart';
import 'package:ezzy_mart_seller_app/views/widgets/custom_textfield.dart';
import 'package:ezzy_mart_seller_app/views/widgets/loading_indicator.dart';
import 'package:ezzy_mart_seller_app/views/widgets/out_button.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  final String? userName;
  const EditProfileScreen({super.key, this.userName});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.nameController.text = widget.userName!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: "Edit Profile", size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);

                      if (controller.profileImgPath.value.isNotEmpty) {
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImgLink =
                            controller.snapshotData['imageUrl'];
                      }

                      if (controller.snapshotData['password'] ==
                          controller.oldPassController.text) {
                        controller.changeAuthPasswird(
                            email: controller.snapshotData['email'],
                            password: controller.oldPassController.text,
                            newPassword: controller.newPassController.text);
                        await controller.updateProfile(
                            imgUrl: controller.profileImgLink,
                            name: controller.nameController.text,
                            password: controller.newPassController.text);

                        VxToast.show(context, msg: "Updated");
                      } else if (controller
                              .oldPassController.text.isEmptyOrNull &&
                          controller.newPassController.text.isEmptyOrNull) {
                        await controller.updateProfile(
                            imgUrl: controller.profileImgLink,
                            name: controller.nameController.text,
                            password: controller.snapshotData['password']);
                        VxToast.show(context, msg: "Updated");
                      } else {
                        VxToast.show(context, msg: "Some Error occured");
                        controller.isloading(false);
                      }
                    },
                    child: normalText(text: "Save", size: 16.0))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                controller.snapshotData['imageUrl'] == '' &&
                        controller.profileImgPath.isEmpty
                    ? Image.asset(imgProduct, width: 150, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make()
                    : controller.snapshotData['imageUrl'] != "" &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(controller.snapshotData['imageUrl'],
                                width: 150, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make()
                        : Image.file(
                                File(
                                  controller.profileImgPath.value,
                                ),
                                width: 150,
                                fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),
                // Image.asset(imgProduct, width: 200)
                //     .box
                //     .roundedFull
                //     .clip(Clip.antiAlias)
                //     .make(),
                10.heightBox,
                ourButton(
                    color: white,
                    onPress: () {
                      controller.changeProfileImage(context);
                    },
                    textColor: fontGrey,
                    title: "Change Image"),
                10.heightBox,
                const Divider(),
                10.heightBox,
                customTextField(
                    label: name,
                    hint: "Eg. Sheeraz Dev",
                    controller: controller.nameController),
                10.heightBox,
                Align(
                    alignment: Alignment.centerLeft,
                    child: boldText(text: "Change Your  Password")),
                20.heightBox,
                customTextField(
                    hint: passwordHint,
                    label: password,
                    controller: controller.oldPassController),
                10.heightBox,
                customTextField(
                    hint: passwordHint,
                    label: "Confirm Password",
                    controller: controller.newPassController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
