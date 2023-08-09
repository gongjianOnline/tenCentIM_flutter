class Register {
  Register({
    required this.code,
    required this.data,
    required this.massage,
  });
  late final int code;
  late final Data? data;
  late final String massage;
  
  Register.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data =json['code']!=null? Data.fromJson(json['data']):null;
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data?.toJson();
    _data['massage'] = massage;
    return _data;
  }
}

class Data {
  Data({
    required this.user,
    required this.tcUserId,
  });
  late final String user;
  late final String tcUserId;
  
  Data.fromJson(Map<String, dynamic> json){
    user = json['user'];
    tcUserId = json['tc_userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['tc_userId'] = tcUserId;
    return _data;
  }
}