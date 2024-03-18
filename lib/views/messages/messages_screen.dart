import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/services/store_services.dart';
import 'package:ezzy_mart_seller_app/views/messages/chat_screen.dart';
import 'package:ezzy_mart_seller_app/views/widgets/loading_indicator.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: purpleColor)),
        title: boldText(text: "Messages", size: 16.0, color: fontGrey),
      ),
      body: StreamBuilder(
        stream: StoreServices.getMessages(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circleColor: purpleColor);
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(data.length, (index) {
                    var t = data[index]['created_on'] == null
                        ? DateTime.now()
                        : data[index]['created_on'].toDate();
                    var time = intl.DateFormat("h:mma").format(t);
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: purpleColor,
                        child: Icon(Icons.person, color: white),
                      ),
                      title: boldText(
                          text: "${data[index]['sender_name']}",
                          size: 16.0,
                          color: fontGrey),
                      subtitle: normalText(
                          text: "${data[index]['last_msg']}",
                          color: darkGrey,
                          size: 16.0),
                      trailing: normalText(text: time, color: darkGrey),
                      onTap: () => Get.to(() => const ChatScreen()),
                    );
                  }),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
