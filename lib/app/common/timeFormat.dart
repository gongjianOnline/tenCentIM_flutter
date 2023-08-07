import 'package:intl/intl.dart';
class TimeFormat {
  /* 时间格式化 时间戳转日期*/
  static toText(timestamp, {formatText = "yyyy-MM-dd"}){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000); // 将秒转换为毫秒
    DateTime localDateTime = dateTime.toLocal();
    String formattedDate = DateFormat(formatText).format(localDateTime);
    return  formattedDate;
  }


}