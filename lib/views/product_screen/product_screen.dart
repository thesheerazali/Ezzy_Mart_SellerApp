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
                            text: "Product Title", color: fontGrey, size: 14.0),
                        subtitle: normalText(text: "\$40", color: darkGrey)))),
          )),
    );
  }
}
