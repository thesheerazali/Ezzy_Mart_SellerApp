import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  var orders = [];

  getOrders(data) {
    orders.clear();
    for (var item in data['orders']) {
      if (item['vendor_id'] == currentUser!.uid) {
        orders.add(item);
      }
    }
  }
}
