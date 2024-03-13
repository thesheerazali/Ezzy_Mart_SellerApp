import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/product/components/product_dropdown.dart';
import 'package:ezzy_mart_seller_app/views/product/components/product_image.dart';
import 'package:ezzy_mart_seller_app/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../widgets/text_widget.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            )),
        title: boldText(text: "Order Details", color: white, size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: normalText(text: "Save", color: white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            customTextField(label: "Product Name", hint: "eg, BMW"),
            10.heightBox,
            customTextField(
                label: "Product Description",
                hint: "eg, Hy The description off blaah blaaah ",
                isDesc: true),
            10.heightBox,
            customTextField(label: "Product Name", hint: "eg, BMW"),
            10.heightBox,
            customTextField(label: "Product Name", hint: "eg, BMW"),
            10.heightBox,
            productDropDown(),
            10.heightBox,
            productDropDown(),
            10.heightBox,
            boldText(text: "Choose Product Images"),
            10.heightBox,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) {
                  return productImage();
                })),
            10.heightBox,
            boldText(
                text: "Note: Image will be your display image ", color: red),
            10.heightBox,
            boldText(text: "Choose Product Color"),
            10.heightBox,
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                  9,
                  (index) => VxBox()
                      .color(Vx.randomPrimaryColor)
                      .roundedFull
                      .size(50, 50)
                      .make()),
            )
          ]),
        ),
      ),
    );
  }
}
