import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seed_sower/ui/register_screen.dart';
import 'package:seed_sower/ui/sign_in_screen.dart';
import 'package:seed_sower/utils/app_constants.dart';

class StartScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      
     body: Stack(

       alignment: Alignment.topLeft,
       children: <Widget>[

         Image.asset('assets/disclaimer-illustration-opaque-1.jpg',
           width: double.infinity,height: double.infinity,
           alignment: Alignment.center,fit: BoxFit.fill,)

         ,

         Column(


          mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

            Padding(padding: EdgeInsets.fromLTRB(0,20.0,0,0),child:
            Image.asset('assets/Seed_Sower_logo_1024x1024.jpg',
              width: 200.00,height: 100.00,
              )
              ,),
            Padding(padding: EdgeInsets.all(20.0),child:

            Text(AppConstants.START_SCREEN_SUBHEADING,style: TextStyle(

                color: Colors.white,fontSize:15.0

            ),softWrap: true,textAlign: TextAlign.center,)

              ,)
            ,
            Padding(padding: EdgeInsets.all(20.0),child: Column(


              children: <Widget>[

              SizedBox(

                    width: double.infinity,
                    child:RaisedButton(onPressed: (){

                      Navigator.push(context,

                      MaterialPageRoute(builder: (context)=>SignInScreen())
                      );

                    },color: Colors.white,
                      child:Text("Sign in",style: TextStyle(fontSize: 15.0,color: Colors.blue),)

                      ,shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(25.0),

                      ),padding: EdgeInsets.all(15.0),
                    )
                ),
               Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),child:
               SizedBox(

                   width: double.infinity,
                   child:RaisedButton(onPressed: (){

                     Navigator.push(context,

                         MaterialPageRoute(builder: (context)=>RegisterScreen())
                     );

                   },color: Colors.white,
                     child:Text("Register",style: TextStyle(fontSize: 15.0,color: Colors.blue),)

                     ,shape: RoundedRectangleBorder(

                       borderRadius: BorderRadius.circular(25.0),

                     ),padding: EdgeInsets.all(15.0),
                   )
               ) ,)


              ],
              
            ),) 

          ],

         )

       ],

     ),
    );

  }
}