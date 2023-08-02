/* 登录获取的sig秘钥数据模型 */
class Sig {
  Sig({
    required this.sig,
  });
  late final String sig;
  
  Sig.fromJson(Map<String, dynamic> json){
    sig = json['sig'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sig'] = sig;
    return _data;
  }
}