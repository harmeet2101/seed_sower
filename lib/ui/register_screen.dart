import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seed_sower/utils/validation_utils.dart';


class RegisterScreen extends StatefulWidget{


  @override
  State createState() {

    return ResgisterState();
  }
}


class ResgisterState extends State<RegisterScreen>{

  FocusNode FocusNode_1 = new FocusNode();
  FocusNode FocusNode_2 = new FocusNode();
  FocusNode FocusNode_3 = new FocusNode();
  FocusNode FocusNode_4 = new FocusNode();
  FocusNode FocusNode_5 = new FocusNode();
  FocusNode FocusNode_6 = new FocusNode();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {



    return Scaffold(

      body: Stack(


        children: <Widget>[

          Image.asset('assets/Register-illustration-opaque-2.jpg',
            width: double.infinity,height: double.infinity,
            alignment: Alignment.center,fit: BoxFit.fill,)

          ,Padding(padding: EdgeInsets.fromLTRB(0,20, 0, 0),
              child:IconButton(icon:Icon(Icons.arrow_back,color: Colors.white), onPressed:(){

                Navigator.pop(context);
              })),
          Align(



            alignment: Alignment.topCenter,

            child: Padding(padding: EdgeInsets.fromLTRB(0,30, 0, 0),
              child: Text('Register',style: TextStyle(fontSize: 18.0,color: Colors.white),),),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0,80.0,0,0),child:

          Container(

            color: Colors.white,height: 1.0,width: double.infinity,
          )
            ,)



      ,Align(
        alignment: Alignment.topLeft,

      child: Padding(padding: EdgeInsets.fromLTRB(0,100, 0, 0),
        child:
            Scrollbar(child:ListView(

              children: <Widget>[

                Form(child: Column(children: <Widget>[

                  Padding(padding: EdgeInsets.all(20.0),child: firstNameField(),),
                  Padding(padding: EdgeInsets.all(20.0),child: lastNameField(),),
                  Padding(padding: EdgeInsets.all(20.0),child:emailField(),),
                  Padding(padding: EdgeInsets.all(20.0),child:cityField(),),
                  Padding(padding: EdgeInsets.all(20.0),child: stateField(),),
                  Padding(padding: EdgeInsets.all(20.0),child: countryField(),),
                  Padding(padding: EdgeInsets.all(20.0),child:phoneField() ,),

                ],),
                  key: _formKey,autovalidate: autoValidate,),

                bottomViews()



              ],
            )),)

    ),

        ],

      ),

    );

  }


  Widget firstNameField(){

    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.text,textInputAction: TextInputAction.next,
      onEditingComplete: (){
        FocusScope.of(context).requestFocus(FocusNode_1);

      },
      decoration: InputDecoration(hintText: "First Name",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

        validator:(String str){

          return ValidationUtils.validate(str, 'First Name');
        });
  }

  Widget lastNameField(){
    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.text,textInputAction: TextInputAction.next,
      focusNode: FocusNode_1,
      onEditingComplete: (){

        FocusScope.of(context).requestFocus(FocusNode_2);
      },
      decoration: InputDecoration(hintText: "Last Name",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

        validator:(String str){

          return ValidationUtils.validate(str, 'Last Name');
        });
  }

  Widget emailField(){
    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.emailAddress,textInputAction: TextInputAction.next,
      focusNode: FocusNode_2,
      onEditingComplete: (){

        FocusScope.of(context).requestFocus(FocusNode_3);
      },
      decoration: InputDecoration(hintText: "Email",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

        validator: ValidationUtils.validateEmail);
  }

  Widget cityField(){
    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.text,textInputAction: TextInputAction.next,
      focusNode: FocusNode_3,
      onEditingComplete: (){
        FocusScope.of(context).requestFocus(FocusNode_4);

      },
      decoration: InputDecoration(hintText: "City",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

        validator:(String str){

          return ValidationUtils.validate(str, 'City');
        });
  }

  Widget stateField(){
    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.text,textInputAction: TextInputAction.next,
      focusNode: FocusNode_4,
      onEditingComplete: (){

        FocusScope.of(context).requestFocus(FocusNode_5);
      },
      decoration: InputDecoration(hintText: "State",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

        validator:(String str){

          return ValidationUtils.validate(str, 'State');
        } );
  }

  Widget countryField(){
    return TextFormField(maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.text,textInputAction: TextInputAction.next,
      focusNode: FocusNode_5,
      onEditingComplete: (){

        FocusScope.of(context).requestFocus(FocusNode_6);
      },
      decoration: InputDecoration(hintText: "Country",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

        validator:(String str){

          return ValidationUtils.validate(str, 'Country');
        });
  }

  Widget phoneField(){
    return TextFormField(maxLength: 10,maxLines: 1,style:
    TextStyle(color:Colors.white,fontSize: 18.0,),
      keyboardType: TextInputType.number,textInputAction: TextInputAction.done,
      focusNode: FocusNode_6,
      onEditingComplete: (){
        SystemChannels.textInput.invokeMethod('TextInput.hide');

      },
      decoration: InputDecoration(hintText: "Phone",
          hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),)),

        validator:(String str){

          return ValidationUtils.validate(str, 'Phone');
    } ,);
  }


  Widget bottomViews(){

    return Container(

      decoration: BoxDecoration(

          color: Color.fromARGB(255, 27, 69, 191)
      ),child:Column(

      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(10, 20.0, 10, 0),child: SizedBox(

            width: double.infinity,
            child:RaisedButton(onPressed: (){



            },color: Colors.white,
              child:Text("Network",style: TextStyle(fontSize: 15.0,color: Colors.black),)

              ,shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(15.0),

              ),padding: EdgeInsets.all(15.0),
            )
        ),),

        Padding(padding: EdgeInsets.fromLTRB(10, 40.0, 10, 30),child:
        SizedBox(

            width: double.infinity,
            child:RaisedButton(onPressed: (){

              _validateInputs();

            },color: Colors.white,
              child:Text("Register",style: TextStyle(fontSize: 15.0,color: Colors.blue),)

              ,shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(15.0),

              ),padding: EdgeInsets.all(15.0),
            )
        ) ,)

      ],
    ) ,
    );
  }


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