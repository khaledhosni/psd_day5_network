import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: UploadScreen(),
          ),
        ),
      ),
    );
  }
}


class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

   var selectedFile;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        selectedFile==null?InkWell(
            onTap: () async {
             await pickImage();
            },
            child: Image.asset("images/upload.png",width: 64,height: 300,)
        )
        :InkWell(
            onTap:() async{
              await pickImage();
            },
            child: Image.file(selectedFile)),
        Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(onPressed: (){}, child: Text("Upload Image")))
      ],
    );
  }


  pickImage()async{

    var picker=ImagePicker();

    var xFile=await picker.pickImage(source: ImageSource.camera);

    if(xFile!=null){
      setState(() {

      //  selected=true;

        selectedFile=File(xFile.path);
      });

    }


  }
}
