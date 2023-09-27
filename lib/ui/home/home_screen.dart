import 'package:flutter/material.dart';
import 'package:psd_day5_network/data/remote/service/UserService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var listOfUsers=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();

  }

  initData()async{
    listOfUsers =await UserService().getAllUsers();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),


    );
  }
}
