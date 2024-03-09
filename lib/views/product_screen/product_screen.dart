import 'package:ezzy_mart_seller_app/views/widgets/appbar.dart';

import '../../const/const.dart';
import '../widgets/text_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appBarWidget("Product"),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                children: List.generate(
                    20,
                    (index) => ListTile(
                          leading: Image.asset(imgProduct),
                          title: boldText(
                              text: "Product Title",
                              color: fontGrey,
                              size: 14.0),
                          subtitle: normalText(text: "\$40", color: darkGrey),
                          trailing: VxPopupMenu(
                              arrowSize: 14,
                              menuBuilder: () => Column(
                                    children: List.generate(
                                        popipManuIcons.length,
                                        (index) => Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    popipManuIcons[index],
                                                  ),
                                                  10.widthBox,
                                                  normalText(
                                                      text:
                                                          popipManuTitle[index],
                                                      color: fontGrey)
                                                ],
                                              ).onTap(() {}),
                                            )),
                                  ).box.rounded.white.width(150).make(),
                              clickType: VxClickType.singleClick,
                              child: const Icon(Icons.more_vert_rounded)),
                        ))),
          )),
    );
  }
}
