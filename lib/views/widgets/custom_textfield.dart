import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';

import '../../const/const.dart';

Widget customTextField({hint, label, controller, isDesc = false}) {
  return TextFormField(
      maxLines: isDesc ? 4 : 1,
      decoration: InputDecoration(
          isDense: true,
          label: normalText(text: label),
          hintText: hint,
          hintStyle: const TextStyle(color: lightGrey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: white))));
}
