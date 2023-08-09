

import '../common/http.dart';

MyHttp http = MyHttp();
class LoginApi {
  /* 登录 */
  static Future login(Map<String,dynamic> data)async{
    try {
      var response = await http.post("/login",data:data);
      return  response;
    } catch (e) {
      throw e;
    }
  }
  /* 注册 */
  static Future register(Map<String,dynamic> data)async{
    try {
      var response = await http.post("/register",data:data);
      return  response;
    } catch (e) {
      throw e;
    }
  }

  
}