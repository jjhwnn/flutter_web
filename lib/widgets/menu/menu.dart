import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/util/asset_path.dart';
import 'package:flutter_web/util/menu_util.dart';
import 'package:flutter_web/util/my_color.dart';
import 'package:flutter_web/util/text_util.dart';
import 'package:flutter_web/widgets/custom_text_button.dart';

class Menu extends StatelessWidget {
  const Menu({required this.curruntIndex, super.key});
  final int curruntIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 70, width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 20,),
          InkWell(
            onTap: () {
              MenuUtil.changeIndex(context, 0);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Image.asset(AssetPath.menuLogoBlack, width: 180, height: 60, fit: BoxFit.fitWidth),
          ),
          const Spacer(),
          ...List.generate(MenuUtil.menuList.length, (index) {
          return  CustomTextButton(
                label: MenuUtil.menuList[index],
                textStyle: curruntIndex == index
                    ? TextUtil.get16(context, MyColor.gray90)
                        .copyWith(fontWeight: FontWeight.bold)
                    : TextUtil.get16(context, MyColor.gray90),
                size: const Size(100, 40),
                onPressed: () {
                  MenuUtil.changeIndex(context, index);
                },
            );
            return Text(MenuUtil.menuList[index]);
          },),
          const SizedBox(width: 20,),

      ],
      ),
    );
  }
}
