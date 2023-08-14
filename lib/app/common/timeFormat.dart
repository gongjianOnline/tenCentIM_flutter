import 'package:intl/intl.dart';
class TimeFormat {
  /* 时间格式化 时间戳转日期*/
  static toText(timestamp, {formatText = "yyyy-MM-dd"}){
    String formattedDate = "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000); // 将秒转换为毫秒
    if(formatText == "yyyy-MM-dd H:mm"){
      /* 获取系统当前时间戳转换成年月日 */
      DateTime date = DateTime.now();
      DateTime lastTime = DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);
      DateTime lastTimeLocalDateTime = lastTime.toLocal();
      String lastDate = DateFormat('yyyy-MM-dd').format(lastTimeLocalDateTime);
      /* 需要转换的时间 */
      DateTime paramsLocalDateTime  = dateTime.toLocal();
      String paramsDate = DateFormat('yyyy-MM-dd').format(paramsLocalDateTime);
      /* 如果是当天只显示时间， 其他则显示日期 */
      if(paramsDate == lastDate){
        formattedDate = "今天  ${DateFormat('H:mm').format(paramsLocalDateTime)}";
      }else{
        formattedDate = DateFormat('yyyy-MM-dd H:mm').format(paramsLocalDateTime);
      }
    }else{
      DateTime localDateTime = dateTime.toLocal();
      formattedDate = DateFormat(formatText).format(localDateTime);
    }
    return  formattedDate;
  }


}