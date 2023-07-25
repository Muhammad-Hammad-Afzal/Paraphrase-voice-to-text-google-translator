import 'package:flutter/material.dart';
import 'package:paraphrasing_tool/res/app_colors.dart';
import 'package:paraphrasing_tool/res/component/home_views.dart';
import 'package:paraphrasing_tool/utils/routes/routes_name.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().lightBlue,
        appBar: AppBar(
          backgroundColor: AppColors().purple,
          title: Center(child: Text('Paraphrase & Translator', style: TextStyle(fontSize: width * .07, color: AppColors().white))),
        ),


        body: Padding(
          padding: EdgeInsets.only(top: height * .17),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors().white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(width * .07), topLeft: Radius.circular(width * .07))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .03),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        HomeViews(onClick: (){
                          Navigator.pushNamed(context, RoutesName.paraphraseText);
                        }, image: 'assets/paraphrase.png', text: 'Paraphrase Text', textSize: width * .045),
                        SizedBox(width: width * .03),
                        HomeViews(onClick: (){
                          Navigator.pushNamed(context, RoutesName.importText);
                        }, image: 'assets/import.png', text: 'Import Text', textSize: width * .045)
                      ],
                    ),
                    SizedBox(height: height * .02),

                    Row(
                      children: [
                        HomeViews(onClick: (){
                          Navigator.pushNamed(context, RoutesName.voiceText);
                        }, image: 'assets/voice.png', text: 'voice Text', textSize: width * .045),
                        SizedBox(width: width * .03),
                        HomeViews(onClick: (){
                          Navigator.pushNamed(context, RoutesName.translateText);
                        }, image: 'assets/translate.png', text: 'Translate Text', textSize: width * .045)
                      ],
                    ),
                    SizedBox(height: height * .02),

                    Row(
                      children: [
                        HomeViews(onClick: (){}, image: 'assets/shop.png', text: 'Shop', textSize: width * .045),
                        SizedBox(width: width * .03),
                        HomeViews(onClick: (){}, image: 'assets/rate.png', text: 'Rate Us', textSize: width * .045)
                      ],
                    ),
                    SizedBox(height: height * .02),

                    Center(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: height * .15,
                          width: width * .445,
                          decoration: BoxDecoration(
                              color: AppColors().purple,
                              borderRadius: BorderRadius.circular(width * .04)
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/share.png', height: height * .1),
                              Text('Share', style: TextStyle(fontSize: width * .045, color: AppColors().white, ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
