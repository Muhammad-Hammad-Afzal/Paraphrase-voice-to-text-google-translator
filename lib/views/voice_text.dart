import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../res/app_colors.dart';
import '../view_model/paraphrase_view_model.dart';


// class VoiceText extends StatelessWidget {
//   const VoiceText({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//
//     var controller = TextEditingController();
//     final textController = TextEditingController();
//     final speechToText = SpeechToText();
//
//
//
//     final ParaphraseViewModel paraphrase = Get.put(ParaphraseViewModel());
//     controller.text = paraphrase.textString.value;
//
//
//     return Scaffold(
//         backgroundColor: AppColors().lightBlue,
//         appBar: AppBar(
//           backgroundColor: AppColors().purple,
//           title: Text('Voice Text', style: TextStyle(color: AppColors().white, fontSize: width * .06)),
//           automaticallyImplyLeading: false,
//           leading: IconButton(onPressed: (){
//             Navigator.pop(context);
//           }, icon: Icon(Icons.arrow_back_ios, color: AppColors().white, size: width * .08)),
//         ),
//
//         body: SingleChildScrollView(
//           child: Container(
//                height: MediaQuery.of(context).size.height * .7,
//                margin: EdgeInsets.only(
//                  top: height * .03,
//                  bottom: height * .03,
//                  right: width * .05,
//                  left: width * .05,
//                ),
//                decoration: BoxDecoration(
//                    color: AppColors().white,
//                    borderRadius: BorderRadius.circular(width * .05)
//                ),
//
//                ///Obx Used For GetX State Management
//                child: Obx(() {
//                  return TextFormField(
//                    onChanged: (value){
//                      value = paraphrase.textString.value;
//                    },
//                    controller: paraphrase.textString.value == '' ? textController : controller,
//                    maxLines: 100,
//                    keyboardType: TextInputType.text,
//                    cursorColor: AppColors().black,
//                    decoration: InputDecoration(
//                        // hintText: paraphrase.textString.value == '' ? 'Hold Button Speech to Text' : paraphrase.textString.value,
//                      hintText: 'This is hint text',
//                        border: InputBorder.none,
//                        contentPadding: EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .02)
//                    ),
//                  );
//                })
//            )
//         ),
//
//
//         ///Mic Button Here
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: Obx((){
//           return GestureDetector(
//
//             ///On Tap Function
//             onTapDown: (details)async{
//               if(!paraphrase.isListen.value){
//                 var available = await speechToText.initialize();
//                 if(available){
//                   paraphrase.isListen.value = true;
//                   speechToText.listen(
//                       onResult: (result){
//                         paraphrase.textString.value = result.recognizedWords;
//                       }
//                   );
//                 }
//               }
//             },
//
//             ///Release The Tap Function
//             onTapUp: (details){
//               paraphrase.isListen.value = false;
//               speechToText.stop();
//             },
//
//             ///Child
//             child: AvatarGlow(
//               endRadius: width * .17,
//               glowColor: AppColors().purple,
//               duration:const Duration(milliseconds: 2000),
//               repeatPauseDuration:const Duration(milliseconds: 100),
//               repeat: true,
//               animate: paraphrase.isListen.value,
//               child: CircleAvatar(
//                 radius: width * .08,
//                 backgroundColor: AppColors().purple,
//                 child: Icon(Icons.mic, color: AppColors().white, size: width * .1),
//               ),
//             ),
//           );
//         })
//     );
//   }
// }




class VoiceText extends StatefulWidget {
  const VoiceText({Key? key}) : super(key: key);

  @override
  State<VoiceText> createState() => _VoiceTextState();
}

class _VoiceTextState extends State<VoiceText> {

  TextEditingController controller = TextEditingController();
 // TextEditingController textController = TextEditingController();
  ParaphraseViewModel paraphraseViewModel = Get.put(ParaphraseViewModel());
  SpeechToText speechToText = SpeechToText();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paraphraseViewModel.controller.value.text = '';
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;




    return Scaffold(
        backgroundColor: AppColors().lightBlue,
        appBar: AppBar(
          backgroundColor: AppColors().purple,
          title: Text('Voice Text', style: TextStyle(color: AppColors().white, fontSize: width * .06)),
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, color: AppColors().white, size: width * .08)),
        ),

        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height * .7,
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

                ///Obx Used For GetX State Management
                child: TextFormField(
                  onChanged: (value){
                    paraphraseViewModel.textString.value = value;
                  },
                  maxLines: 100,
                  controller: paraphraseViewModel.controller.value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                       hintText: 'This is hint text',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .02)
                  ),
                )
            )
        ),


        ///Mic Button Here
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx((){
          return GestureDetector(

            ///On Tap Function
            onTapDown: (details)async{
              if(!paraphraseViewModel.isListen.value){
                var available = await speechToText.initialize();
                if(available){

                  paraphraseViewModel.isListen.value = true;
                  speechToText.listen(
                      onResult: (result){
                        paraphraseViewModel.controller.value.text = result.recognizedWords;
                        paraphraseViewModel.textString.value = result.recognizedWords;

                      }
                  );

                }
              }
            },

            ///Release The Tap Function
            onTapUp: (details){

              paraphraseViewModel.isListen.value = false;
              speechToText.stop();
            },

            ///Child
            child: AvatarGlow(
              endRadius: width * .17,
              glowColor: AppColors().purple,
              duration:const Duration(milliseconds: 2000),
              repeatPauseDuration:const Duration(milliseconds: 100),
              repeat: true,
              animate: paraphraseViewModel.isListen.value,
              child: CircleAvatar(
                radius: width * .08,
                backgroundColor: AppColors().purple,
                child: Icon(Icons.mic, color: AppColors().white, size: width * .1),
              ),
            ),
          );
        })
    );
  }
}

