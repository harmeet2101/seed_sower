import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seed_sower/ui/reset_password_screen.dart';
import 'package:seed_sower/utils/common_utils.dart';
import 'package:seed_sower/utils/validation_utils.dart';

class SignInScreen extends StatefulWidget{


  @override
  State createState() {

    return SignInState();
  }
}


class SignInState extends State<SignInScreen>{

  bool initialCheckboxValue = false;
  FocusNode passwordTextfiledFocusNode = new FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool autoValidate = false;
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
                child: Text('Sign In',style: TextStyle(fontSize: 18.0,color: Colors.white),),),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0,80.0,0,0),child:

            Container(

              color: Colors.white,height: 1.0,width: double.infinity,
            )
              ,)

            ,Align(alignment: Alignment.center ,child:Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Form(child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(20.0),child: emailField(),)

                    ,

                    Padding(padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),child: passwordField(),)

                  ],
                ),key: _formKey,autovalidate:autoValidate ,)


                ,
                Align(

                  alignment: Alignment.center,
                  child: Padding(padding: EdgeInsets.fromLTRB(0,20, 0, 0),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.push(context,

                              MaterialPageRoute(builder: (context)=>ResetPassword())
                          );
                        },child:Text('Forgot password?',style: TextStyle(fontSize: 14.0,color: Colors.white),),

                      )),
                )
                ,
                Padding(padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),child:nextButton()
                ,)
                ,
                Align(

                  alignment: Alignment.center,
                  child: Padding(padding:EdgeInsets.fromLTRB(0,20, 0, 0) ,child:

                  GestureDetector(

                    onTap: (){
                      setState(() {
                        initialCheckboxValue = !initialCheckboxValue;

                      });

                    },child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      InkWell(
                        child: Container(

                          decoration: BoxDecoration(shape: BoxShape.circle,
                              border:Border.all(color: Colors.white), color: Colors.white ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: initialCheckboxValue
                                ? Icon(
                              Icons.check,
                              size: 20.0,
                              color: Colors.black,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),)

                      ,Padding(padding: EdgeInsets.fromLTRB(10.0,0.0, 0.0,0.0),
                          child:Text('Stay Logged In',style: TextStyle(fontSize: 14.0,color: Colors.white),))

                    ],
                  ),
                  )

                    ,),
                )


              ],

            ))
          ],




        )



    );
  }


  Widget emailField(){
    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.emailAddress,textInputAction: TextInputAction.next,

      onSaved: (String value){

        _email = value;
      },
      onEditingComplete:(){

        FocusScope.of(context).requestFocus(passwordTextfiledFocusNode);
      },

      decoration: InputDecoration(hintText: "Email",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),
      validator:ValidationUtils.validateEmail,

    );
  }

  Widget passwordField(){

    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.text,obscureText: true,textInputAction: TextInputAction.done,
      focusNode: passwordTextfiledFocusNode,
      onSaved: (String value){

      _password = value;

      },
      onEditingComplete:(){

        CommonUtils.hideKeyboard();
      },
      decoration: InputDecoration(hintText: "Password",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),
      validator: ValidationUtils.validatePassword,
    );
  }

  Widget nextButton(){

    return SizedBox(

        width: double.infinity,
        child:RaisedButton(onPressed: (){
          CommonUtils.hideKeyboard();
          _validateInputs();

        },color: Colors.white,
          child:Text("Continue",style: TextStyle(fontSize: 15.0,color: Colors.blue),)

          ,shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(25.0),

          ),padding: EdgeInsets.all(15.0),
        )
    );
  }
  String _email;
  String _password;


  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }


}
