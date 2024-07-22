
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/menu/menu.dart';
import 'package:flutter_web/widgets/screen_layout_builder.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(myBuilder: (screenModel, web, tablet, mobile) {
      return Scaffold(
        body: Column(
          children: [
            Menu(curruntIndex: 1, screenModel: screenModel,),
          ],
        ),
      );
    },);

  }
}
