import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/orders/components/order_placed.dart';
import 'package:ezzy_mart_seller_app/views/widgets/out_button.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
        title: boldText(text: "Order Details", color: darkGrey, size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(
            color: green,
            onPress: () {},
            title: "Confirm Order",
            textColor: white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order delvery status section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "Order Status", color: fontGrey, size: 16.0),
                  SwitchListTile(
                      dense: false,
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey)),
                  SwitchListTile(
                      dense: false,
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey)),
                  SwitchListTile(
                      dense: false,
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey)),
                  SwitchListTile(
                      dense: false,
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey)),
                ],
              )
                  .box
                  .padding(const EdgeInsets.all(8))
                  .outerShadowMd
                  .white
                  .border(color: green)
                  .roundedSM
                  .make(),

              10.heightBox,

              // Detail sections
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "Order Details", color: fontGrey, size: 16.0),
                  orderPlacedDetail(
                    title1: 'Order Code',
                    d1: " data['order_code']",
                    title2: 'Shipping Method',
                    d2: " data['shipping_method']",
                  ),
                  orderPlacedDetail(
                    title1: 'Order Date',
                    d1: DateTime.now(),
                    // d1: intl.DateFormat()
                    //     .add_yMd()
                    //     .format(data['order_date'].toDate()),
                    title2: 'Payment Method',
                    d2: "data['payment_method']",
                  ),
                  orderPlacedDetail(
                    title1: 'Payment Status',
                    d1: "Unpaid",
                    title2: 'Delivery Status',
                    d2: "Order Placed",
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // "Shipping Adress".text.fontFamily(bold).make(),
                                boldText(
                                    text: "Shipping Adress",
                                    color: purpleColor),
                                "Name: {data['order_by_name']}".text.make(),
                                "Email: {data['order_by_email']}".text.make(),
                                "Address: {data['order_by_address']}"
                                    .text
                                    .make(),
                                "City: {data['order_by_city']}".text.make(),
                                "State: {data['order_by_state']}".text.make(),
                                "Phone No: {data['order_by_phone']}"
                                    .text
                                    .make(),
                                "Postal Code: {data['order_by_postal']}"
                                    .text
                                    .make(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * .28,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // "Total Amount".text.fontFamily(bold).make(),
                                boldText(
                                    text: "Total Amount", color: purpleColor),
                                boldText(
                                    text: "\$300.0",
                                    color: redColor,
                                    size: 16.0),
                                // 60.heightBox,
                                // "${data['total_amount']}"
                                //     .numCurrency
                                //     .text
                                //     .color(redColor)
                                //     .fontFamily(bold)
                                //     .make(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .outerShadowMd
                  .padding(const EdgeInsets.all(8))
                  .white
                  .border(color: green)
                  .roundedSM
                  .make(),

              10.heightBox,

              boldText(text: "Order Product", color: fontGrey, size: 16.0)
                  .paddingOnly(left: 8),
              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(3, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlacedDetail(
                          title1: "Pro-Title: {data['orders'][index]['title']}",
                          title2: "Qty: x{data['orders'][index]['qty']}",
                          d1: "Pro-Price: {data['orders'][index]['tprice']}",
                          d2: "Refundable"),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Color: ".text.make(),
                              Container(
                                height: 20,
                                width: 30,
                                color: purpleColor,
                              ),
                            ],
                          )),
                      const Divider()
                    ],
                  );
                }).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(const EdgeInsets.only(bottom: 4))
                  .make(),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
