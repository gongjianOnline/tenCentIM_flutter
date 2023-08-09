class Sig {
  Sig({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final Data? data;
  late final String message;
  
  Sig.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = json['data']!=null?Data.fromJson(json['data']):null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data?.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.tcUserId,
    required this.user,
    required this.sig,
  });
  late final String tcUserId;
  late final String user;
  late final String sig;
  
  Data.fromJson(Map<String, dynamic> json){
    tcUserId = json['tc_userId'];
    user = json['user'];
    sig = json['sig'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tc_userId'] = tcUserId;
    _data['user'] = user;
    _data['sig'] = sig;
    return _data;
  }
}