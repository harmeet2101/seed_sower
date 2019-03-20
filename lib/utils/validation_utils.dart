class ValidationUtils{

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(value.isEmpty)
      return 'Email must not be Empty';
    else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static String validatePassword(String value){
    if(value.length<=0)
      return 'Password must not be Empty';
    else if(value.length<5){

      return 'Password must be more than 5 character';
    }else
      return null;
  }


  static String validateName(String value){
    if(value.isEmpty)
      return 'Name must not be Empty';
    else
      return null;
  }


  static String validate(String value,String label){
    if(value.isEmpty)
      return label + ' ' +'must not be Empty';
    else
      return null;
  }
}