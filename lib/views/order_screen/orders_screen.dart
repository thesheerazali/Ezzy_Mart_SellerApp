import 'package:ezzy_mart_seller_app/views/widgets/appbar.dart';

import '../../const/const.dart';
import '../widgets/text_widget.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Orders"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(
                20,
                (index) => ListTile(
                  onTap: () {},
                  tileColor: textfieldGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: boldText(text: "67487476386", color: purpleColor),
                  subtitle: Column(
                    children: [
                      Row(children: [
                        const Icon(Icons.calendar_month),
                        10.widthBox,
                        boldText(
                            text: intl.DateFormat()
                                .add_yMd()
                                .format(DateTime.now()),
                            color: fontGrey)
                      ]),
                      Row(children: [
                        const Icon(Icons.payment),
                        10.widthBox,
                        boldText(text: "Unpaid", color: red)
                      ])
                    ],
                  ),
                  trailing:
                      boldText(text: "\$40.0", color: purpleColor, size: 16.0),
                ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
              ),
            )),
      ),
    );
  }
}
