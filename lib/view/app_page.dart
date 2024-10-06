import 'package:authorization/view/logIn_page.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFA9A0C
    ),
    body: Column(children: [
      Padding(
    padding: const EdgeInsets.only(top:305,left:127,right: 128),
    child: Image.asset('assets/images/chef.png',height: 120,width: 120,),
    
      ),
      Padding(
    padding: const EdgeInsets.only(top:16,left:112,right: 113),
    child: InkWell(child: Text('Chef App',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
    onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      },),
      )
    ],)
    );
  }
}