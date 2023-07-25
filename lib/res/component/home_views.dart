import 'package:flutter/material.dart';
import 'package:paraphrasing_tool/res/app_colors.dart';

class HomeViews extends StatelessWidget {
  final String image;
  final String text;
  final double textSize;
  final VoidCallback onClick;
  const HomeViews({Key? key,
    required this.image,
    required this.text,
    required this.textSize,
    required this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: height * .15,
          width: width * .445,
          decoration: BoxDecoration(
            color: AppColors().purple,
            borderRadius: BorderRadius.circular(width * .04)
          ),
          child: Column(
            children: [
              Image.asset(image, height: height * .1),
              Text(text, style: TextStyle(fontSize: textSize, color: AppColors().white, ))
            ],
          ),
        ),
      ),
    );
  }
}
