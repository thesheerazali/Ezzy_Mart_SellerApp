import 'package:ezzy_mart_seller_app/const/const.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendorsCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }

  static getMessages(uid) {
    return firestore
        .collection(chatCollection)
        .where('toid', isEqualTo: uid)
        .snapshots();
  }

  static getOrders(uid) {
    return firestore
        .collection(orderCollection)
        .where('vendors', arrayContains: uid)
        .snapshots();
  }
}
