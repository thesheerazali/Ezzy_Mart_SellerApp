import 'package:ezzy_mart_seller_app/const/const.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendorsCollection)
        .where('vendor_id', isEqualTo: uid)
        .get();
  }
}
