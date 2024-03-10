import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/messages/chat_screen.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: purpleColor,
                        child: Icon(
                          Icons.person,
                          color: white,
                        ),
                      ),
                      title: boldText(text: "User Name", color: fontGrey),
                      subtitle:
                          normalText(text: "Last Message", color: darkGrey),
                      trailing: normalText(text: "10:45 PM", color: darkGrey),
                      onTap: () => Get.to(() => const ChatScreen()),
                    )),
          ),
        ),
      ),
    );
  }
}
