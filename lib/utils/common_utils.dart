import 'package:flutter/services.dart';

class CommonUtils{


  static void hideKeyboard(){
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}