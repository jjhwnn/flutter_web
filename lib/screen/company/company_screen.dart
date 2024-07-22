
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/menu/menu.dart';
import 'package:flutter_web/widgets/screen_layout_builder.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {

    return ScreenLayoutBuilder(myBuilder: (screenModel, web, tablet, mobile) {
      return Scaffold(
        body: Column(
          children: [
            Menu(curruntIndex: 0, screenModel: screenModel),
          ],
        ),
      );
    },);


  }
}
