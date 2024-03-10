import 'package:ezzy_mart_seller_app/const/const.dart';

import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../orders/orders_screen.dart';
import '../product/product_screen.dart';
import '../profile/profile_screen.dart';
import 'home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBar = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 35), label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(icProducts, width: 24, color: darkGrey),
          label: "Products"),
      BottomNavigationBarItem(
          icon: Image.asset(icorders, width: 24, color: darkGrey),
          label: "Orders"),
      BottomNavigationBarItem(
          icon: Image.asset(icgeneralSetings, color: darkGrey, width: 24),
          label: "Setting")
    ];

    var navBody = [
      const HomeScreen(),
      const ProductScreen(),
      const OrdersScreen(),
      const SettingScreen(),
    ];

    return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: purpleColor,
            unselectedItemColor: darkGrey,
            currentIndex: controller.navIndex.value,
            onTap: (index) {
              controller.navIndex.value = index;
            },
            items: navBar,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        body: Column(
          children: [
            Obx(() =>
                Expanded(child: navBody.elementAt(controller.navIndex.value)))
          ],
        ));
  }
}
