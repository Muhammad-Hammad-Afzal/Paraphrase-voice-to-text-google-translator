import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paraphrasing_tool/view_model/translation_view_model.dart';



class DropDown extends StatelessWidget {
  TextEditingController controller;

   DropDown({Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionViewModel = Get.put(TranslationViewModel());


    return CustomDropdown.search(
        onChanged: (value){
          value = transactionViewModel.destinationSelectedLanguage.value.text;
          transactionViewModel.translate(transactionViewModel.textController.value.text, context);
        },
        hintText: 'English is select Automatically',
        items:TranslationViewModel.languages,
        controller: controller
    );
  }
}
