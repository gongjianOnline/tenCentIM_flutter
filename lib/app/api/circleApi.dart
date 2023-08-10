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



}