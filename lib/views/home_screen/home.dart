import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/controllers/home_controller.dart';
import 'package:ezzy_mart_seller_app/views/order_screen/orders_screen.dart';
import 'package:ezzy_mart_seller_app/views/product_screen/product_screen.dart';
import 'package:ezzy_mart_seller_app/views/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBar = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30), label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(icProducts, width: 24, color: darkGrey),
          label: "Categories"),
      BottomNavigationBarItem(
          icon: Image.asset(icorders, width: 24, color: darkGrey),
          label: "Cart"),
      BottomNavigationBarItem(
          icon: Image.asset(icgeneralSetings, color: darkGrey, width: 24),
          label: "Profile")
    ];

    var navBody = [
      const HomeScreen(),
      const ProductScreen(),
      const OrdersScreen(),
      const SettingScreen(),
    ];

    return SafeArea(
      child: Scaffold(
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
              backgroundColor: white,
            ),
          ),
          body: Column(
            children: [
              Obx(() =>
                  Expanded(child: navBody.elementAt(controller.navIndex.value)))
            ],
          )),
    );
  }
}
