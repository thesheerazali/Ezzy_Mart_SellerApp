import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/home_screen/home.dart';
import 'package:ezzy_mart_seller_app/views/widgets/out_button.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
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
                  boldText(text: appname, size: 20.0)
                ],
              ),
              40.heightBox,
              Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: emailHint,
                        prefixIcon: Icon(Icons.email, color: purpleColor)),
                  ),
                  10.heightBox,
                  const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: passwordHint,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: purpleColor,
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: normalText(
                            text: forgetPassword, color: purpleColor)),
                  ),
                  20.heightBox,
                  SizedBox(
                    width: context.screenWidth - 100,
                    child: ourButton(
                        color: purpleColor,
                        onPress: () {
                          Get.to(() => Home());
                        },
                        textColor: white,
                        title: login),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .outerShadowMd
                  .padding(const EdgeInsets.all(8))
                  .make(),
              10.heightBox,
              Center(
                child: normalText(text: anyProblem, color: lightGrey),
              ),
              const Spacer(),
              Center(
                child: normalText(text: credits, color: lightGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
