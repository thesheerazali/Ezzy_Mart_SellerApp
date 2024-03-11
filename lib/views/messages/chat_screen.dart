import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/messages/components/chat_bubble.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: purpleColor)),
        title: boldText(text: "Chat", color: fontGrey, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return chatBubble();
              },
            )),
            10.heightBox,
            SizedBox(
              height: 60,
              child: Row(children: [
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(
                      isDense: true,
                      hintText: "Enter Message",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: purpleColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: purpleColor))),
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: purpleColor))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
