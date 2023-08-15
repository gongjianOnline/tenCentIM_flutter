
class FriendInfo {
  late int relation; /**是否是好友 */
  late String userID; /**好友ID */
  late int allowType; /*好友验证方式 */
  late int birthday; /**生日 */
  late int gender; /**性别 */
  late String nickName; /**昵称 */
  late String selfSignature; /**签名 */
  late String faceUrl; /**签名 */
  


  FriendInfo({
    this.relation = 0, 
    this.userID = "", 
    this.allowType = 0,
    this.birthday = 0,
    this.gender = 1,
    this.nickName = "",
    this.selfSignature = "",
    this.faceUrl = ""
  });

  FriendInfo.fromJson(Map<String, dynamic> json) {
    relation = json['relation'];
    userID = json['userID'];
    allowType = json['allowType'];
    birthday = json['birthday'];
    gender = json['gender'];
    nickName = json['nickName'];
    selfSignature = json['selfSignature'];
    faceUrl = json['faceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['relation'] = relation;
    data['userID'] = userID;
    data['allowType'] = allowType;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['nickName'] = nickName;
    data['selfSignature'] = selfSignature;
    data['faceUrl'] = faceUrl;
    return data;
  }
}