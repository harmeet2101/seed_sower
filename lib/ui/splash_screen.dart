import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seed_sower/ui/start_screen.dart';
import 'package:seed_sower/utils/app_constants.dart';

void main() => runApp(
    MaterialApp(
  home: SplashScrn(),
  debugShowCheckedModeBanner: false,
  routes: <String, WidgetBuilder>{
    '/StartScreen': (BuildContext context) => new StartScreen()
  },

  theme:_themeData.copyWith(

    primaryColor: Color.fromARGB(255, 76, 32, 217),
    hintColor: Colors.white,

    inputDecorationTheme: InputDecorationTheme(

      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(
        color: Colors.white,width: 2.0

      )),
      labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0
      ),
    ),
  ),

)


);
ThemeData _themeData = new ThemeData();

class SplashScrn extends StatefulWidget{



  @override
  State createState() {

    return SplashState();
  }
}


class SplashState extends State<SplashScrn>{


  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
    startDelay();
  }


  @override
  Widget build(BuildContext context) {


    return Image.asset('assets/Menu-illustration-opaque1.jpg',
      width: double.infinity,height: double.infinity,alignment: Alignment.center,fit: BoxFit.fill,);

  }




  startDelay() async{
    var _duration = Duration(milliseconds:AppConstants.SPLASH_DURATION);
    return new Timer(_duration,navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/StartScreen');
  }
}



