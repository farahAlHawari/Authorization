import 'package:authorization/service/auth_service.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:34,bottom: 40),
              child: Container(width:327,height:42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xffFA9A0C)
               
              ),
              child: Center(child: Text('Meals',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Color(0xffffffff)))),),
            ),
          ),
          FutureBuilder(future: getMeals(), builder: (context,snapshot){
            if (snapshot.hasData) {
              return Expanded(
                child: ListView.builder(itemCount:snapshot.data!.meals.length ,
                  itemBuilder:(context,index){
                return ListTile(
                    leading: Container(height: 50,width: 100,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(snapshot.data!.meals[index].images[0]),
                    fit: BoxFit.contain)),)
                 , title: Text(snapshot.data!.meals[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                 subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(snapshot.data!.meals[index].category,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                     Row(
                       children: [
                         Text(snapshot.data!.meals[index].price.toString(),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                         SizedBox(width: 5,),
                         Text('LE',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),)
                       ],
                     ),
                   ],
                 ),
                 trailing: Image.asset('assets/images/2.png',scale: 1.5,),

                 
                 
                  // title: Text(snapshot.data!.meals[index].images[0]),
                );
                // return Card(
                //   elevation: 10,
                //   shadowColor: Colors.grey,
                //   child: Container(),
                // );
                }),
              );

            }
            else {
              return CircularProgressIndicator();
            }
          })
        ],
      ),
    );
  }
}