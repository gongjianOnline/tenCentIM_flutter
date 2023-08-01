

import '../common/http.dart';

MyHttp http = MyHttp();
class LoginApi {
  static Future login(Map<String,dynamic> data)async{
    try {
      var response = await http.post("/login",data:data);
      return  response;
    } catch (e) {
      throw e;
    }
  }

  
}