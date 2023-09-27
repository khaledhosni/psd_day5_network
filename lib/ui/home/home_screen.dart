import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:psd_day5_network/data/remote/model/User.dart';
import 'package:psd_day5_network/data/remote/service/UserService.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User> listOfUsers=[];

  bool dataLoaded=false;

  _HomeScreenState(){


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   initData();
  }

  initData() async {

    try {
      listOfUsers = await UserService().getAllUsers();
    }on Exception catch(e){
      Alert(context: context,desc: e.toString());
    }
    setState(() {

        dataLoaded=true;
    });
    print(listOfUsers);
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
          dataLoaded?
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listOfUsers.length,
              itemBuilder: (context, index) {

              return Card(
                elevation: 1,
                margin: EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(listOfUsers[index].avatar!, width: 100,height: 100,fit: BoxFit.cover,),
                    Column(
                      children: [
                        Text(listOfUsers[index].name!,),
                        Text(listOfUsers[index].phone!),
                        Text(listOfUsers[index].country!),
                      ],
                    )
                  ],
                ),
              );

            },),
          )
              :Center(child: SizedBox(child: LoadingIndicator(indicatorType: Indicator.ballPulse),width: 32,height: 32,))
        ],
      ),
    );
  }
}
