import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../const/const.dart';
import '../widgets/text_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: fontGrey,
            )),
        title: boldText(text: "Product Detail", color: darkGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                viewportFraction: 1.0,
                aspectRatio: 16 / 9,
                //  itemCount: data['p_imgs'].length,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgProduct,
                    // data['p_imgs'][index],
                    width: double.infinity,
                    fit: BoxFit.fill,
                  );
                }),

            10.heightBox,
            //title and dtail section

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title.text
                  //     .size(16)
                  //     .color(darkFontGrey)
                  //     .fontFamily(semibold)
                  //     .make(),

                  boldText(text: "Product Title", color: fontGrey, size: 16.0),

                  10.heightBox,

                  //rating

                  VxRating(
                    isSelectable: false,
                    // value: double.parse(data['p_rating']),
                    value: 3.0,
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                  ),

                  10.heightBox,

                  boldText(text: "\$300.0", color: red, size: 18.0),

                  // "${data['p_price']}"
                  //     .numCurrency
                  //     .text
                  //     .color(redColor)
                  //     .fontFamily(bold)
                  //     .size(18)
                  //     .make(),

                  10.heightBox,

                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Color:", color: fontGrey),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  // .color(Color(data['p_colors']
                                  //         [index])
                                  //     .withOpacity(1.0))
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()
                                  .onTap(() {}),
                            ),
                          )
                        ],
                      ),

                      //Quintity Row
                      10.heightBox,
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child:
                                  boldText(text: "Quintity:", color: fontGrey)),
                          Row(
                            children: [
                              // IconButton(
                              //     onPressed: () {
                              //       // controller.decreQuantity();
                              //       // controller.calculateTotalPrice(
                              //       //     int.parse(data['p_price']));
                              //     },
                              //     icon: const Icon(Icons.remove)),

                              //     boldText(text: "20", size: 18.0, color: fontGrey),
                              // // controller.quantity.value.text
                              // //     .size(16)
                              // //     .fontFamily(bold)
                              // //     .color(darkFontGrey)
                              // //     .make(),
                              // IconButton(
                              //     onPressed: () {
                              //       // controller.increaseQuantity(
                              //       //     int.parse(data['p_quantity']));
                              //       // controller.calculateTotalPrice(
                              //       //     int.parse(data['p_price']));
                              //     },
                              //     icon: const Icon(Icons.add)),
                              10.widthBox,
                              boldText(text: "20", color: fontGrey),
                            ],
                          ),
                        ],
                      ),

                      //total amount
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).make(),
                  Divider(),
                  20.heightBox,
                  boldText(text: "Description", size: 16.0, color: fontGrey),
                  10.heightBox,
                  normalText(
                      text:
                          "GHDjhdhjchjfjhvhjbmmvmjh hjgccvjhgg hgjvhu vfutd,ufj y itif",
                      color: fontGrey)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
