import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';

Widget productDropDown() {
  return DropdownButton(
          hint: normalText(text: "Choose Categoy", color: fontGrey),
          value: null,
          isExpanded: true,
          padding: const EdgeInsets.all(8),
          items: [],
          onChanged: (value) {})
      .box
      .white
      .padding(const EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .make();
}
