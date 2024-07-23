import 'package:flutter/material.dart';
import 'package:flutter_web/model/screen_model.dart';
import 'package:flutter_web/widgets/footer.dart';
import 'package:flutter_web/widgets/menu/menu.dart';
import 'package:flutter_web/widgets/page_drawer.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    required this.currentIndex,
    required this.screenModel,
    required this.children,
    this.black = true,
    super.key});

  final int currentIndex;
  final ScreenModel screenModel;
  final List<Widget> children;
  final bool black;

  @override
  Widget build(BuildContext context) {
    children.add(const Footer());
    return Scaffold(
      endDrawer: PageDrawer(currentIndex: currentIndex, tablet: screenModel.tablet),
      body: Stack(
        children: [

          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: children,
              ),
            ),
          ),

          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Menu(
                currentIndex: currentIndex,
                screenModel: screenModel,
                black: black,
            ),
          ),
        ],
      ),
    );
  }
}
