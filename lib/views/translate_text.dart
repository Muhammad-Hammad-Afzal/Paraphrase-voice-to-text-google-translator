import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paraphrasing_tool/res/app_colors.dart';
import 'package:paraphrasing_tool/res/component/custom_dropdown.dart';
import 'package:paraphrasing_tool/view_model/translation_view_model.dart';



class TranslateText extends StatelessWidget {
  const TranslateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final translationViewModel = Get.put(TranslationViewModel());





    return WillPopScope(
        onWillPop: ()async {
          translationViewModel.textController.value.text = '';
          translationViewModel.result.value = '';
          return true;
        },
      child: Scaffold(
        backgroundColor: AppColors().lightBlue,
        appBar: AppBar(
          backgroundColor: AppColors().purple,

          //app bar
          title: Text('Translate Text', style: TextStyle(color: AppColors().white, fontSize: width * .07)),
          automaticallyImplyLeading: false,

          //Back Button
          leading: IconButton(onPressed: (){
            translationViewModel.textController.value.text = '';
            translationViewModel.result.value = '';
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, color: AppColors().white, size: width * .08),
        ),
        ),

        body: SingleChildScrollView(
              child: Column(
                children: [

                  ///Select Start Language
                  Card(
                      color: AppColors().lightBlue,
                      elevation: width * .04,
                      child:
                      CustomDropdown(
                          hintText: 'AutoDetect',
                          items:const ['AutoDetection'],
                          controller: TextEditingController()
                      )
                  ),

                  ///Write Text You Want
                  SizedBox(
                    height: height * .36,
                    width: double.infinity,
                    child: Card(
                      color: AppColors().white,
                      elevation: width * .02,

              //Here is the TextFormField
                      child: TextFormField(
                        onChanged: (value){
                          translationViewModel.translate(value, context);
                        },
                        controller: translationViewModel.textController.value,
                        maxLines: 100,
                        style: TextStyle(fontSize: width * .05),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01)
                        ),
                      ),
                    ),
                  ),

                  // ///InterChange Languages
                  // GestureDetector(
                  //     onTap: (){
                  //       translationViewModel.interChangeLanguages();
                  //     },
                  //     child: Image.asset('assets/change.jpg')),
                  SizedBox(height: height * .02),

                  ///Select Destination Language
                  Card(
                      color: AppColors().lightBlue,
                      elevation: width * .04,
                      child: Obx(() => DropDown(
                          controller: translationViewModel.destinationSelectedLanguage.value))
                  ),

                  ///Translated Text Here
                  SizedBox(
                    height: height * .36,
                    width: double.infinity,
                    child: Card(
                      color: AppColors().white,
                      elevation: width * .02,

              //Here is the TextFormField
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01),
                        child: Obx((){
                          return SingleChildScrollView(child: Text(translationViewModel.result.value, style: TextStyle(fontSize: width * .05)));
                        })
                      ),
                    ),
                  ),

                ],
              ),
            ),
      ),
    );
  }
}











