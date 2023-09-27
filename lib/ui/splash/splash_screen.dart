import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
            child: SplashScreen() ,
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset("images/logo.png",width: 128,height: 128,),
        Text("Port Said Container and Cargo Handling Co."),
        SizedBox(
          width: 32,
          height: 32,
          child: LoadingIndicator(indicatorType: Indicator.ballRotate,
          backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}


