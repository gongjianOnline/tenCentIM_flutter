import '../common/http.dart';

MyHttp http = MyHttp();

class CircleApi {
  /* 发送朋友圈 */
  static send(Map<String,dynamic>data)async{
    try {
      var response = await http.post("/circle/sendTrends",data:data);
      return  response;
    } catch (e) {
      rethrow;
    }
  }

  /* 拉去朋友圈列表*/
  static getList(Map<String,dynamic>data)async{
    try {
      var response = await http.get("/circle/getTrends",queryParameters:data);
      return  response;
    } catch (e) {
      rethrow;
    }
  }

  /* 进入朋友圈详情 */
  static getDetails(Map<String,dynamic> data)async{
    try {
      var response = await http.get("/circle/getTrendDetails",queryParameters:data);
      return  response;
    } catch (e) {
      rethrow;
    }
  }

  /* 发送朋友圈 */
  static sendCommit(Map<String,dynamic> data)async{
    try {
      var response = await http.post("/circle/commit",data:data);
      return  response;
    } catch (e) {
      rethrow;
    }
  }

  /* 获取个人朋友圈 */
  static getPersonal(Map<String,dynamic> data)async{
    try {
      var response = await http.get("/circle/getPersonal",queryParameters:data);
      return  response;
    } catch (e) {
      rethrow;
    }
  }



}