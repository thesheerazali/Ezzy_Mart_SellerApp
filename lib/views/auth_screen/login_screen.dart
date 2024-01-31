import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 18.0),
              20.heightBox,
              Row(
                children: [
                  Image.asset(
                    icLogo,
                    width: 70,
                    height: 70,
                  )
                      .box
                      .border(color: Colors.white)
                      .rounded
                      .padding(const EdgeInsets.all(8))
                      .make(),
                  10.widthBox,
                  boldText(text: appname, size: 18.0)
                ],
              ),
              20.heightBox,
              Column(
                children: [
                  TextField(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .outerShadowMd
                  .padding(const EdgeInsets.all(8))
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
