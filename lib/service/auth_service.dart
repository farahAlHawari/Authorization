import 'package:authorization/model/meals_model.dart';
import 'package:authorization/model/user_model.dart';
import 'package:dio/dio.dart';
String Token = '';
Future <bool> signin(UserModel user)async{

try {
  Dio req = Dio();
Response res = await req.post('https://food-api-omega.vercel.app/api/v1/chef/signin', data: user.toMap());
if (res.statusCode==202) {
  Token=res.data['token'];
  return true;
}
else{
  return false;
}
} catch (e) {
  return false;
  print(e);
}
}
Future <MealModel> getMeals()async{
Dio req = Dio();
Response res = await req.get('https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals'
,options: Options(headers: {
  "token":"FOODAPI $Token"
}))
;
MealModel meal = MealModel.fromMap(res.data);
return meal ;
}