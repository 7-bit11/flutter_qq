class UserSendUserMsgModel {
  late String imageurl;
  late String msg;
  late String? type;
  late String? role;
  UserSendUserMsgModel(
      {required this.imageurl,
      required this.msg,
      this.type = "text", //text 、 image
      this.role = "i"}); // i 、you
}
