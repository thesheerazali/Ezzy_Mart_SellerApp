import '../../const/const.dart';

Widget customTextField({String? title, String? hint, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).semiBold.size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle( color: textfieldGrey),
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: redColor),
            )),
      ),
      7.heightBox
    ],
  );
}
