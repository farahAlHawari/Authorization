
import 'dart:convert';

class UserModel {
    final String email;
    final String password;

    UserModel({
        required this.email,
        required this.password,
    });


 toMap(){
  return{
    "email":email,
    "password":password,
  };
  
 }
    
}

