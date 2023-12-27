class MsgModel {
  late String imageurl;
  late String name;
  late String msg;
  late String time;
  late String? count;
  MsgModel({
    required this.imageurl,
    required this.name,
    required this.msg,
    required this.time,
    this.count,
  });
}
