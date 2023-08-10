import '../common/http.dart';

MyHttp http = MyHttp();

class UserApi {
  /*导入好友列表到数据库 */
  static relation(Map<String,dynamic>data)async{
    try {
      var response = await http.post("/users/importFriends",data:data);
      return  response;
    } catch (e) {
      throw e;
    }
  }

  /* 根据搜索好友名称获取好友id */
  static getFriendID(Map<String,dynamic> data)async{
    try {
      var response = await http.get("/users/getFriendId",queryParameters:data);
      return  response;
    } catch (e) {
      throw e;
    }
  }

  
}