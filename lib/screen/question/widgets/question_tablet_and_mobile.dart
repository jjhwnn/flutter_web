import 'package:flutter/material.dart';
import 'package:flutter_web/screen/question/widgets/question_widgets.dart';
import 'package:flutter_web/util/my_color.dart';
import 'package:flutter_web/util/question_util.dart';
import 'package:flutter_web/util/text_util.dart';
import 'package:flutter_web/widgets/custom_text_button.dart';

class QuestionTabletAndMobile extends StatefulWidget {
  const QuestionTabletAndMobile({super.key});

  @override
  State<QuestionTabletAndMobile> createState() =>
      _QuestionTabletAndMobileState();
}

class _QuestionTabletAndMobileState extends State<QuestionTabletAndMobile> {
  final qUtil = QuestionUtil();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        QuestionWidgets.dropdownBox(
          // height: 50,
          context: context,
          web: true,
          label: "프로젝트 / 서비스 선택 *",
          labelList: ['앱', '웹', '서비스', '협의'],
          selectedIndex: qUtil.questionTypeIndex,
          onChanged: (index) {
            qUtil.changeQuestionType(index);
            setState(() {});
          },
        ),
        const SizedBox(height: 16),
        QuestionWidgets.formFieldBox(
            context: context,
            web: true,
            label: '문의 제목*',
            controller: qUtil.titleController,
            textInputType: TextInputType.text,
            hintText: '문의 제목을 입력해주세요'),
        const SizedBox(height: 16),
        QuestionWidgets.formFieldBox(
            context: context,
            web: true,
            label: '문의인 이름*',
            controller: qUtil.nameController,
            textInputType: TextInputType.text,
            hintText: "문의인 이름을 입력해주세요"),
        const SizedBox(height: 16),
        QuestionWidgets.formFieldBox(
            context: context,
            web: true,
            label: '이메일 *',
            controller: qUtil.emailController,
            textInputType: TextInputType.emailAddress,
            hintText: "회신받을 이메일을 남겨주세요"),
        const SizedBox(height: 16),
        QuestionWidgets.contentBox(context, true, qUtil.contentController),
        const SizedBox(height: 16),
        QuestionWidgets.dropdownBox(
          context: context,
          web: true,
          label: '예산',
          labelList: [
            '협의',
            '1000만원',
            '2000만원',
            '3000만원',
            '4000만원',
            '5000만원',
          ],
          selectedIndex: qUtil.questionPriceIndex,
          onChanged: (index) {
            qUtil.changeQuestionPrice(index);
            setState(() {});
          },
        ),
        const SizedBox(height: 40),
        CustomTextButton(
          label: '문의하기',
          textStyle: TextUtil.get16(context, Colors.white),
          size: const Size(double.infinity, 56),
          backgroundColor: MyColor.blue40,
          onPressed: !qUtil.checkValidation() ? null : () {},
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
