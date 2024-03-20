import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  var confirmed = false.obs;
  var ondelivery = false.obs;
  var delivered = false.obs;
  var orders = [];

  getOrders(data) {
    orders.clear();
    for (var item in data['orders']) {
      if (item['vendor_id'] == currentUser!.uid) {
        orders.add(item);
      }
    }
  }

  changeStatus({title, stutus, docID}) async {
    var store = firestore.collection(orderCollection).doc(docID);
    await store.set({title: stutus}, SetOptions(merge: true));
  }
}
