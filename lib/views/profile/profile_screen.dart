import 'package:ezzy_mart_seller_app/views/messages/messages_screen.dart';
import 'package:ezzy_mart_seller_app/views/profile/edit_profile_screen.dart';
import 'package:ezzy_mart_seller_app/views/shop_setting/shop_setting_screen.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Profile", size: 20.0),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const EditProfileScreen()),
              icon: const Icon(Icons.edit)),
          TextButton(onPressed: () {}, child: normalText(text: "Log Out"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(imgProduct)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              title: boldText(text: "Vendor Name"),
              subtitle: normalText(text: "vendor2@gmail.com"),
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
        ),
      ),
    );
  }
}
