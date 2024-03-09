import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:intl/intl.dart' as intl;

AppBar appBarWidget(title) {
  return AppBar(
    backgroundColor: white,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: fontGrey, size: 16.0),
    actions: [
      Center(
          child: normalText(
              text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
              color: purpleColor)),
      10.widthBox,
    ],
  );
}
