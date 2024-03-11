import 'package:ezzy_mart_seller_app/views/widgets/text_widget.dart';

import '../../const/const.dart';

Widget ourButton({
  color,
  textColor,
  String? title,
  onPress,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: normalText(text: title, size: 16.0, color: textColor));
}
