import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paraphrasing_tool/view_model/paraphrase_view_model.dart';
import '../res/app_colors.dart';

class ParaphraseText extends StatelessWidget {
  const ParaphraseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final ParaphraseViewModel paraphrase = Get.put(ParaphraseViewModel());

    // final textController = TextEditingController();

    //To Show Paraphrase List data in TextFormField
    final temporary = TextEditingController();


    //Function get Index data
    void changeIndexValue(){
      temporary.text = paraphrase.dataList[paraphrase.index.value ++];
      temporary.text = paraphrase.dataList[paraphrase.index.value++];
    }



    return Scaffold(
      backgroundColor: AppColors().lightBlue,

      appBar: AppBar(
        backgroundColor: AppColors().purple,
        title: Text('Paraphrase Text', style: TextStyle(color: AppColors().white, fontSize: width * .06)),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: AppColors().white, size: width * .08)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            ///TextFormField
            Container(
              height: MediaQuery.of(context).size.height * .73,
              margin: EdgeInsets.only(
                  top: height * .03,
                  bottom: height * .03,
                  right: width * .05,
                  left: width * .05,
              ),
              decoration: BoxDecoration(
              color: AppColors().white,
              borderRadius: BorderRadius.circular(width * .05)
              ),

                //Obx Used For GetX State Management
                child: Obx(() {
                  return TextFormField(

                    //If User Enter New Text For Paraphrasing Purpose
                    onChanged: (value){
                      paraphrase.index.value = 1;
                      value = paraphrase.textController.value.text;
                      paraphrase.onChange.value = true;
                      paraphrase.dataList.clear();

                    },
                    controller:paraphrase.dataList.isEmpty ? paraphrase.textController.value : temporary,
                    maxLines: 100,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors().black,
                    decoration: InputDecoration(
                        hintText:'Write Your Text Here . . .',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .02)
                    ),
                  );
                })
            ),

            ///Button
            GestureDetector(
              onTap: (){

                //If User Enter New Data In TextFormField
                if(paraphrase.onChange.value){
                  paraphrase.paraphraseApi(paraphrase.textController.value.text, context).then((value) {
                    changeIndexValue();
                  });

                }

                //Restart Printing data from List
                if(paraphrase.index.value == 20){
                  paraphrase.index.value = 0;
                  changeIndexValue();
                }

                //Print Next Index data From The List
                else{
                  changeIndexValue();
                }

              },

                //Button Text
              child: Obx(() {
                return Container(
                  height: MediaQuery.of(context).size.height * .07,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      bottom: height * .03,
                      left: width * .05,
                      right: width * .05
                  ),
                  decoration: BoxDecoration(
                      color: AppColors().purple,
                      borderRadius: BorderRadius.circular(width * .09)
                  ),

                  //When Click Here For Paraphrase
                  child:paraphrase.loading.value ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors().white),
                      SizedBox(width: width * .05),
                      Text('Processing...', style: TextStyle(color: AppColors().lightBlack, fontSize: width * .05))
                    ],
                  )) :
                  Center(child: Text('Paraphrase', style: TextStyle(color: AppColors().white, fontSize: width * .06,))),
                );
              })
            )
          ],
        ),
      )
    );
  }
}
