import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psd_day5_network/data/remote/service/ImageService.dart';
import 'package:psd_day5_network/data/remote/model/ImageUlpad.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

   File? selectedFile;
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
            child: Image.file(selectedFile!)),
        Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(onPressed: (){

              uploadImage();
            }, child: Text("Upload Image")))
      ],
    );
  }


 pickImage()async{

    var picker=ImagePicker();

    var xFile=await picker.pickImage(source: ImageSource.camera);

    // user selected a file
    if(xFile!=null){
      setState(() {
        selectedFile=File(xFile.path);
      });


    }

  }


  uploadImage() async{



    var index=selectedFile!.path.lastIndexOf(".");
    var type=selectedFile!.path.substring(index+1);

    var imageByte= await selectedFile!.readAsBytes();
    String imageBase64= base64Encode(imageByte);


   var img=ImageUpload(name:"ahmed"+DateTime.now().millisecond.toString(),
     type: type,
     src:imageBase64

    );

    var uploaded=await ImageService().uploadImage(img);

    if(uploaded){
      Alert(context: context, desc: "your image has been uploaded").show();
    }else{
      Alert(context: context,desc: "failed to upload").show();

    }

    print(selectedFile!.path);
    print(type);
    print(imageBase64);
  }
}
