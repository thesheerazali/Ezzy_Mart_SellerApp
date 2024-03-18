import 'package:ezzy_mart_seller_app/views/widgets/dashboard_button.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';

import '../../const/const.dart';
import 'package:intl/intl.dart' as intl;

import '../widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget("Dashboard"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dashBoardButton(context,
                      count: 75, title: products, icon: icProducts),
                  dashBoardButton(context,
                      count: 75, title: orders, icon: icorders)
                ],
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dashBoardButton(context,
                      count: 75, title: rating, icon: icStar),
                  dashBoardButton(context,
                      count: 75, title: totalSale, icon: icSale)
                ],
              ),
              10.heightBox,
              Divider(),
              10.heightBox,
              boldText(text: "Popoler Products", color: fontGrey, size: 16.0),
              20.heightBox,
              ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      10,
                      (index) => ListTile(
                          leading: Image.asset(imgProduct),
                          title: boldText(
                              text: "Product Title",
                              color: fontGrey,
                              size: 14.0),
                          subtitle: normalText(text: "\$40", color: darkGrey))))
            ],
          ),
        ),
      ),
    );
  }
}
