import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezzy_mart_seller_app/controllers/auth_controller.dart';
import 'package:ezzy_mart_seller_app/controllers/profile_controller.dart';
import 'package:ezzy_mart_seller_app/services/store_services.dart';
import 'package:ezzy_mart_seller_app/views/auth/login_screen.dart';
import 'package:ezzy_mart_seller_app/views/messages/messages_screen.dart';
import 'package:ezzy_mart_seller_app/views/profile/edit_profile_screen.dart';
import 'package:ezzy_mart_seller_app/views/shop_setting/shop_setting_screen.dart';
import 'package:ezzy_mart_seller_app/views/widgets/loading_indicator.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Profile", size: 20.0),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => EditProfileScreen(
                    userName: controller.snapshotData['vendor_name'],
                  )),
              icon: const Icon(Icons.edit)),
          TextButton(
              onPressed: () async {
                Get.offAll(() => const LoginScreen());

                await Get.find<AuthController>()
                    .signOutMethod(context: context);
                Get.deleteAll();
              },
              child: normalText(text: "Log Out"))
        ],
      ),
      body: StreamBuilder(
        stream: StoreServices.getProfile(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circleColor: white);
          } else {
            controller.snapshotData = snapshot.data!.docs[0];
            return Column(
              children: [
                ListTile(
                  leading: controller.snapshotData['imageUrl'] == ''
                      ? Image.asset(imgProduct, width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : Image.network(
                          controller.snapshotData['imageUrl'],
                          width: 100,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
                  // leading: Image.asset(imgProduct)
                  //     .box
                  //     .roundedFull
                  //     .clip(Clip.antiAlias)
                  //     .make(),
                  title: boldText(
                      size: 16.0,
                      text: "${controller.snapshotData['vendor_name']}"),
                  subtitle:
                      normalText(text: "${controller.snapshotData['email']}"),
                ),
                const Divider(),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                        profileButtnIcons.length,
                        (index) => ListTile(
                              leading: Icon(
                                profileButtnIcons[index],
                                color: white,
                              ),
                              title: boldText(text: profileButtonTitle[index]),
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Get.to(() => const ShopSetting());

                                    break;
                                  case 1:
                                    Get.to(() => const MessagesScreen());

                                    break;

                                  default:
                                }
                              },
                            )),
                  ),
                )
              ],
            );
          }
        },
      ),
      //
    );
  }
}
