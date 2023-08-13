class CircleDet {
  CircleDet({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final CircleDetData data;
  late final String message;
  
  CircleDet.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = CircleDetData.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class CircleDetData {
  CircleDetData({
    required this.circleInfo,
    required this.commitList,
  });
  late final CircleInfo circleInfo;
  late final List<CommitList>? commitList;
  
  CircleDetData.fromJson(Map<String, dynamic> json){
    circleInfo = CircleInfo.fromJson(json['circleInfo']);
    commitList = List.from(json['commitList']).map((e)=>CommitList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['circleInfo'] = circleInfo.toJson();
    _data['commitList'] = commitList?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CircleInfo {
  CircleInfo({
    this.content,
    this.time,
    this.imgUrl,
    this.userId,
    this.circleId,
    this.like,
  });
  late final String? content;
  late final int? time;
  late final String? imgUrl;
  late final String? userId;
  late final String? circleId;
  late final int? like;
  
  CircleInfo.fromJson(Map<String, dynamic> json){
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

class CommitList {
  CommitList({
    this.commit,
    this.time,
    this.userId,
    this.circleId,
  });
  late final String? commit;
  late final int? time;
  late final String? userId;
  late final String? circleId;
  
  CommitList.fromJson(Map<String, dynamic> json){
    commit = json['commit'];
    time = json['time'];
    userId = json['userId'];
    circleId = json['circleId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['commit'] = commit;
    _data['time'] = time;
    _data['userId'] = userId;
    _data['circleId'] = circleId;
    return _data;
  }
}