import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:psd_day5_network/ui/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(

        body: Center(
          child: Container(
            child: SplashScreen() ,
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('init state method has been called');
  }

  @override
  Widget build(BuildContext context) {
    print('build method is started');


    Future.delayed(Duration(seconds: 4),() {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(child: Image.asset("images/logo.png",width: 128,height: 128,),
          margin: EdgeInsets.only(top: 100,),
        ),
        Container(child: Text("Port Said Container and Cargo Handling Co."
          ,style:GoogleFonts.delaGothicOne(
            textStyle: TextStyle(
                color: Colors.brown, fontSize: 24),
          ),
          textAlign: TextAlign.center,
        ),
          margin: EdgeInsets.only(top: 32),
        ),

        Container(
          margin: EdgeInsets.only(top: 300),
          child: SizedBox(
            width: 32,
            height: 32,
            child: LoadingIndicator(indicatorType: Indicator.ballRotate,
              backgroundColor: Colors.white,
              colors: [Colors.brown],
            ),
          ),
        )
      ],
    );
  }

  @override
  void didUpdateWidget(covariant SplashScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print('did update method ---> UI has been loaded');
  }



}


