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
  
  var file;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,

      children: [
        
        file==null?
          InkWell(child: FlutterLogo(size: 128,),
            onTap: () async{
              print('image is clicked');
                await  selectImage();

            },
          ) :
        Image.file(file,width: 256,height: 256,),
        
        ElevatedButton(onPressed: (){}, child: Text("Upload"))
        
      ],
    );
  }


  selectImage() async{
    var picker = ImagePicker();

    // Capture a photo.
     XFile? photo = await picker.pickImage(source: ImageSource.gallery);
     var file=File(photo!.path);


     setState(() {
       this.file=file;
     });


  }
}
