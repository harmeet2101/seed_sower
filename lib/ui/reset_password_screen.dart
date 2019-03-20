import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seed_sower/ui/sign_in_screen.dart';
import 'package:seed_sower/utils/common_utils.dart';
import 'package:seed_sower/utils/validation_utils.dart';

class ResetPassword extends StatefulWidget{


  @override
  State createState() {

    return ResetPasswordState();
  }
}


class ResetPasswordState extends State<ResetPassword>{

  FocusNode FocusNode_1 = new FocusNode();
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      resizeToAvoidBottomPadding: false,
      body: Stack(

        children: <Widget>[

          Image.asset('assets/Register-illustration-opaque-1.jpg',
            width: double.infinity,height: double.infinity,
            alignment: Alignment.center,fit: BoxFit.fill,),
          Padding(padding: EdgeInsets.fromLTRB(0,20, 0, 0),
              child:IconButton(icon:Icon(Icons.arrow_back,color: Colors.white), onPressed:(){

                Navigator.pop(context);
              })),
          Align(



            alignment: Alignment.topCenter,

            child: Padding(padding: EdgeInsets.fromLTRB(0,30, 0, 0),
              child: Text('Reset Password',style: TextStyle(fontSize: 18.0,color: Colors.white),),),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0,80.0,0,0),child:

          Container(

            color: Colors.white,height: 1.0,width: double.infinity,
          )
            ,)

          ,Align(alignment: Alignment.center ,child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Form(child: Column(children: <Widget>[

                Padding(padding: EdgeInsets.all(20.0),child:nameField())
                ,
                Padding(padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),child:emailField(),)

              ]),key: _key,autovalidate: _autoValidate,),


              Padding(padding: EdgeInsets.fromLTRB(20.0,50.0, 20.0, 0),child:button(),)



            ],

          ))
        ],




      ),
    );

  }


  Widget nameField(){

    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),

      keyboardType: TextInputType.text,textInputAction: TextInputAction.next,
      onSaved: (String value){

        //FocusScope.of(context).requestFocus(FocusNode_1);
      },
      onEditingComplete: (){
        FocusScope.of(context).requestFocus(FocusNode_1);

      },
      decoration: InputDecoration(hintText: "Name",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

    validator:ValidationUtils.validateName
    );
  }

  Widget emailField(){
    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.emailAddress,textInputAction: TextInputAction.done,
      focusNode: FocusNode_1,

      onSaved: (String value){

        CommonUtils.hideKeyboard();
      },
      decoration: InputDecoration(hintText: "Email",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

    validator: ValidationUtils.validateEmail,);
  }

  Widget button(){
    return SizedBox(

        width: double.infinity,
        child:RaisedButton(onPressed: (){
          _validateInputs();

        },color: Colors.white,
          child:Text("Continue",style: TextStyle(fontSize: 15.0,color: Colors.blue),)

          ,shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(25.0),

          ),padding: EdgeInsets.all(15.0),
        )
    );

  }


  void _validateInputs() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}