import 'package:authorization/model/user_model.dart';
import 'package:authorization/service/auth_service.dart';
import 'package:authorization/view/menu_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
final TextEditingController email = TextEditingController();
final TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(width: 375,height: 222,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/1.png"))),
          child: Center(
            child: Text('Welcome Back',
            style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.white),),
          ),
          ),
          SizedBox(height: 103,),
          Padding(
            padding: const EdgeInsets.only(left:24,right: 24),
            child: TextField(controller: email,
              decoration: InputDecoration(
              
              hintText: 'E-mail',
              hintStyle: TextStyle(color: Colors.grey,fontSize: 16
              ),
              border: OutlineInputBorder(
              ),
              focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Color(0xffFA9A0C)),
               borderRadius: BorderRadius.all(Radius.circular(8)),
               ),
           
                
              ),),
          ),
          SizedBox(height: 32,),

           Padding(
            padding: const EdgeInsets.only(left:24,right: 24),
            child: TextField(obscureText: true,
            controller: Password,
            decoration: InputDecoration(
            
suffixIcon: Icon(Icons.visibility_off_outlined),
suffixIconColor: Colors.grey,
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey,fontSize: 16
              ),
              border: OutlineInputBorder(
              ),
              focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Color(0xffFA9A0C)),
               borderRadius: BorderRadius.all(Radius.circular(8)),
               ),
           
                
              ),),
          ),
          SizedBox(height: 14,),
          Padding(
            padding: const EdgeInsets.only(right:215,left:24),
            child: Text('forget password ?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:64),
            child: FilledButton(onPressed: ()async{
bool status = await signin(UserModel(email: email.text, password: Password.text));
 if (status) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("correct email and password"),
                  backgroundColor: Colors.green,
                ));
              Navigator.push(context, MaterialPageRoute(builder:(context) => MenuPage()));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("you enter incorrect information"),
                  backgroundColor: Colors.red,
                ));
                    }



            }, child: Text('Sign in',
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),),
            style: FilledButton.styleFrom(
             backgroundColor: Color(0xffFA9A0C,),
             shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),),
             minimumSize: Size(327, 42)
            )
            ),
          ),
          SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('Don’t have an account?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.grey)),
            Text(' Sign Up',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffFA9A0C))),
          ],)
        ],
      ),
    );
  }
}