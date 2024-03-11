import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';

Widget orderPlacedDetail({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: title1, color: purpleColor),
            boldText(text: d1, color: redColor)
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: title2, color: purpleColor),
              boldText(text: d2, color: fontGrey)
            ],
          ),
        ),
      ],
    ),
  );
}
