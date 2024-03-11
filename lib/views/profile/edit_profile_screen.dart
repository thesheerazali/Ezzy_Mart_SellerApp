import 'package:ezzy_mart_seller_app/const/colors.dart';
import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/widgets/custom_textfield.dart';
import 'package:ezzy_mart_seller_app/views/widgets/out_button.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: "Edit Profile", size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: normalText(text: "Save", size: 16.0))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(imgProduct, width: 200)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              10.heightBox,
              ourButton(
                  color: white,
                  onPress: () {},
                  textColor: fontGrey,
                  title: "Change Image"),
              10.heightBox,
              Divider(),
              10.heightBox,
              customTextField(label: name, hint: "Sheeraz Dev"),
              10.heightBox,
              customTextField(hint: passwordHint, label: password),
              10.heightBox,
              customTextField(hint: passwordHint, label: "Confirm Password"),
            ],
          ),
        ),
      ),
    );
  }
}
