import 'package:ezzy_mart_seller_app/const/colors.dart';
import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/widgets/custom_textfield.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: "Shop Setting", size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: normalText(text: "Log Out", size: 16.0))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(hint: "eg- Vendor Name", label: "Shop Name"),
            10.heightBox,
            customTextField(
                hint: "eg- Near SUHSJ Sindh", label: "Shop Address"),
            10.heightBox,
            customTextField(hint: "eg- +923063011668", label: "Shop Mobile"),
            10.heightBox,
            customTextField(hint: "eg- emart.shop.com", label: "Shop Website"),
            10.heightBox,
            customTextField(
                isDesc: true,
                hint: "eg- Lhgdhvkhfh hgcvgvhjvuyjmjvh",
                label: "Description"),
          ],
        ),
      ),
    );
  }
}
