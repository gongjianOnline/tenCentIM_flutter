class CircleSend {
  CircleSend({
    required this.code,
    this.data,
    required this.message,
  });
  late final int code;
  late final Null data;
  late final String message;
  
  CircleSend.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data;
    _data['message'] = message;
    return _data;
  }
}