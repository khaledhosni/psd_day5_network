import 'package:flutter/material.dart';
import 'package:psd_day5_network/data/remote/model/User.dart';
import 'package:psd_day5_network/data/remote/service/UserService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User> listOfUsers=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();

  }

  initData()async{
    print('init data has been called');
    listOfUsers =await UserService().getAllUsers();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PSD"),
      ),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listOfUsers.length,
              itemBuilder: (context, index) {

              return Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(listOfUsers[index].avatar!, width: 100,height: 100,fit: BoxFit.cover,),
                    Column(
                      children: [
                        Text(listOfUsers[index].name!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                        Text(listOfUsers[index].phone!,style: TextStyle(fontSize: 16, ),textAlign: TextAlign.start),
                        Text(listOfUsers[index].country!,style:TextStyle(fontSize: 16),textAlign: TextAlign.start,),
                      ],
                    )
                  ],
                ),
              );

            },),
          )
        ],
      ),
    );
  }
}
