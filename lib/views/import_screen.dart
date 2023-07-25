import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:paraphrasing_tool/res/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';


class ImportText extends StatefulWidget {
  const ImportText({Key? key}) : super(key: key);

  @override
  State<ImportText> createState() => _ImportTextState();
}

class _ImportTextState extends State<ImportText> {

  List paths = [];
  List names = [];

  String? fileName;
  String? filePath;
  String pdfText = '';

  PlatformFile? pickedFile;

  Future pickPdf()async{
    final result =await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['docx', 'doc', 'pdf'],
      allowMultiple: false,
    );
    if(result != null){
      setState(() {
        fileName = result.files.first.name;
        pickedFile = result.files.first;
        filePath = result.files.single.path.toString();
      });
    }
    paths.add(filePath);
    names.add(fileName);
  }


  Future<void> openFile(String path) async {
    await OpenFilex.open(path);
  }




  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors().lightBlue,
      appBar: AppBar(
        backgroundColor: AppColors().purple,
        title: Text('Import Text', style: TextStyle(color: AppColors().white, fontSize: width * .06)),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: AppColors().white, size: width * .08)),
      ),


      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                openFile(paths[index]);
              },
              child: ListTile(

                leading:names[index].contains('.pdf') ? const CircleAvatar(backgroundImage: AssetImage('assets/pdf.png')) : const CircleAvatar(backgroundImage: AssetImage('assets/docx.png')),
                title: Text(names[index].toString()),
              ),
            );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors().purple,
          child: Icon(Icons.add, color: AppColors().white, size: width * .08),
          onPressed: ()async{
            var status =await Permission.storage.request();

            if(status == PermissionStatus.granted){
              pickPdf();
            }
          }),
    );
  }
}
