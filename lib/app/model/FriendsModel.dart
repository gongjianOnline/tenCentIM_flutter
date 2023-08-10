class Friends {
  Friends({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final List<Data>? data;
  late final String message;
  
  Friends.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = json['data'] != null?List.from(json['data']).map((e)=>Data.fromJson(e)).toList():null;
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

class Data {
  Data({
    required this.user,
    required this.password,
    required this.tcUserId,
  });
  late final String user;
  late final String password;
  late final String tcUserId;
  
  Data.fromJson(Map<String, dynamic> json){
    user = json['user'];
    password = json['password'];
    tcUserId = json['tc_userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['password'] = password;
    _data['tc_userId'] = tcUserId;
    return _data;
  }
}