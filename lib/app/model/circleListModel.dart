class CircleList {
  CircleList({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final List<CircleListData>? data;
  late final String message;
  
  CircleList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = json['data'] != null ?List.from(json['data']).map((e)=>CircleListData.fromJson(e)).toList():null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data?.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class CircleListData {
  CircleListData({
    required this.content,
    required this.time,
    required this.imgUrl,
    required this.userId,
    required this.circleId,
    this.like,
  });
  late final String content;
  late final int time;
  late final String imgUrl;
  late final String userId;
  late final String circleId;
  late final int? like;
  
  CircleListData.fromJson(Map<String, dynamic> json){
    content = json['content'];
    time = json['time'];
    imgUrl = json['imgUrl'];
    userId = json['userId'];
    circleId = json['circleId'];
    like = json['like'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content;
    _data['time'] = time;
    _data['imgUrl'] = imgUrl;
    _data['userId'] = userId;
    _data['circleId'] = circleId;
    _data['like'] = like;
    return _data;
  }
}