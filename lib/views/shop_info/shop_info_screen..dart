import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezzy_mart_seller_app/const/colors.dart';
import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/controllers/profile_controller.dart';
import 'package:ezzy_mart_seller_app/views/widgets/custom_textfield.dart';
import 'package:ezzy_mart_seller_app/views/widgets/loading_indicator.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:get/get.dart';

import '../../services/store_services.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(() => Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: "Shop Info", size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.updateShopSetting(
                          shopAdress: controller.shopAdressController.text,
                          shopDescription:
                              controller.shopDescriptionController.text,
                          shopMobile: controller.shopMobileNoControoler.text,
                          shopName: controller.shopNameController.text,
                          shopWebsite: controller.shopWebsiteController.text);
                      // ignore: use_build_context_synchronously
                      VxToast.show(context, msg: "Shop  Updated");
                    },
                    child: normalText(text: "Save", size: 16.0))
          ],
        ),
        body: StreamBuilder(
            stream: StoreServices.getProfile(currentUser!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return loadingIndicator(circleColor: white);
              } else {
                var data = snapshot.data!.docs[0];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      customTextField(
                          hint: "eg- Vendor Name",
                          label: data['shop_name'],
                          controller: controller.shopNameController),
                      10.heightBox,
                      customTextField(
                          hint: "eg- Near SUHSJ Sindh",
                          label: data['shop_address'],
                          controller: controller.shopAdressController),
                      10.heightBox,
                      customTextField(
                          hint: "eg- +923063011668",
                          label: data['shop_mobile'],
                          controller: controller.shopMobileNoControoler),
                      10.heightBox,
                      customTextField(
                          hint: "eg- emart.shop.com",
                          label: data['shop_Website'],
                          controller: controller.shopWebsiteController),
                      10.heightBox,
                      customTextField(
                          isDesc: true,
                          hint: "eg- Lhgdhvkhfh hgcvgvhjvuyjmjvh",
                          label: data['shop_description'],
                          controller: controller.shopDescriptionController),
                    ],
                  ),
                );
              }
            })));
  }
}
