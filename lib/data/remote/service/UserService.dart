

import 'package:psd_day5_network/data/remote/model/User.dart';
import 'package:psd_day5_network/data/remote/service/API.dart';

class UserService{
  
  var dio= API().dio;
  
 Future<List<User>> getAllUsers() async{

   var list= <User>[];
       var response=await dio.get("Users");

       List userList=response.data;

       userList.forEach((element) {
         var u=User.fromJson(element);

         list.add(u);
       });


       return list;
  }

 Future<List<User>> getUserByName(String name)async{

   var list=<User>[];
       var response=await dio.get("Users?name=$name");
       List jsonList=response.data;

       jsonList.forEach((element) {
         var u=User.fromJson(element);
         list.add(u);
       });

       return list;
  }
  
 Future<User>  getUserById(int id)async{

        var response= await dio.get("Users/$id");
        var u=User.fromJson(response.data);

        return u;
  }
}