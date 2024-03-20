import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezzy_mart_seller_app/controllers/orders_controller.dart';
import 'package:ezzy_mart_seller_app/services/store_services.dart';
import 'package:ezzy_mart_seller_app/views/orders/order_detail_screen.dart';
import 'package:ezzy_mart_seller_app/views/widgets/appbar.dart';
import 'package:ezzy_mart_seller_app/views/widgets/loading_indicator.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../widgets/text_widget.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());
    return Scaffold(
        appBar: appBarWidget("Orders"),
        body: StreamBuilder(
          stream: StoreServices.getOrders(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: List.generate(data.length, (index) {
                        var time = data[index]['order_date'].toDate();
                        return ListTile(
                          onTap: () {
                            Get.to(() => OrderDetailsScreen(
                                  data: data[index],
                                ));
                          },
                          tileColor: textfieldGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          title: boldText(
                              text: data[index]['order_code'],
                              color: purpleColor),
                          subtitle: Column(
                            children: [
                              Row(children: [
                                const Icon(Icons.calendar_month),
                                10.widthBox,
                                boldText(
                                    text: intl.DateFormat()
                                        .add_yMMMd()
                                        .format(time),
                                    color: fontGrey)
                              ]),
                              Row(children: [
                                const Icon(Icons.payment),
                                10.widthBox,
                                boldText(text: "Unpaid", color: red)
                              ])
                            ],
                          ),
                          trailing: boldText(
                              text: data[index]['total_amount'],
                              color: purpleColor,
                              size: 16.0),
                        ).box.margin(const EdgeInsets.only(bottom: 4)).make();
                      }),
                    )),
              );
            }
          },
        ));
  }
}
