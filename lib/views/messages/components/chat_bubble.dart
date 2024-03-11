import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:intl/intl.dart' as intl;

import '../../../const/const.dart';

Widget chatBubble() {
  // var t =
  //     data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  // var time = intl.DateFormat("h:mma").format(t);
  return Directionality(
    // textDirection:
    //     data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    textDirection: TextDirection.ltr,
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          // color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
          color: purpleColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // "${data['msg']}".text.white.size(15).make(),
        normalText(text: "Your Message heree...."),
        10.heightBox,
        // time.text.color(whiteColor.withOpacity(0.5)).make()
        normalText(text: "10:45 pm")
      ]),
    ),
  );
}
