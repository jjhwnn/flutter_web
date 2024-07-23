import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/util/my_color.dart';
import 'package:flutter_web/util/text_util.dart';
import 'package:flutter_web/widgets/custom_dropdown_button.dart';
import 'package:flutter_web/widgets/custom_text_form_field.dart';

class QuestionWidgets {
  static Widget contentTitle(BuildContext context, bool web, String label) {
    TextStyle textStyle = web
        ? TextUtil.get16(context, MyColor.gray40)
        .copyWith(fontWeight: FontWeight.w600)
        : TextUtil.get14(context, MyColor.gray40)
        .copyWith(fontWeight: FontWeight.w600);
    return Text(label, style: textStyle);
  }

  static Widget dropdownBox({required BuildContext context,
    required bool web,
    required String label,
    required List<String> labelList,
    required int selectedIndex,
    required Function(int index) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contentTitle(context, web, label),
        const SizedBox(height: 4),
        CustomDropdownButton(
            height: web ? 56 : 48,
            labelList: labelList,
            web: web,
            selectedIndex: selectedIndex,
            onChanged: onChanged)
      ],
    );
  }

  static Widget formFieldBox({required BuildContext context,
    required bool web,
    required String label,
    required TextEditingController controller,
    required TextInputType textInputType,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contentTitle(context, web, label),
        const SizedBox(height: 4),
        SizedBox(
          height: web ? 56 : 48,
          child: CustomTextFormField(
              verticalPadding: 25,
              controller: controller,
              textInputType: textInputType,
              hintText: hintText
          ),
        )
      ],
    );
  }
}
