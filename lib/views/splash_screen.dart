import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paraphrasing_tool/utils/routes/routes_name.dart';

import '../res/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors().purple,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * .09),
                child: Center(child: Text('Paraphrasing', style: TextStyle(color: AppColors().white, fontSize: width * .09))),
              ),
              SizedBox(height: height * .1),
              Image.asset('assets/p_shape.png', filterQuality: FilterQuality.medium),
              SizedBox(height: height * .17),
              Center(child: Text('Translate and\n paraphrase your\n text', style: TextStyle(fontSize: width * .07, color: AppColors().white),textAlign: TextAlign.center))
            ]
        ),
      ),
    );
  }
}
