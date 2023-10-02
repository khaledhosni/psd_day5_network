import 'package:psd_day5_network/data/remote/model/ImageUlpad.dart';
import 'package:psd_day5_network/data/remote/service/API.dart';

class ImageService{

  var dio= API().dio;
  
  
  
 Future<bool> uploadImage(ImageUpload image)async{
  var response =await dio.post("images",data: image.toJson());
    if(response.statusCode==201)
      return true;
    else 
      return false;
  }
  
  
}