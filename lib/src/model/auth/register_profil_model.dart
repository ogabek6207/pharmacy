class ProfileRegisterModel {
  ProfileRegisterModel({
    required this.status,
    required this.msg,
  });

  int status;
  String msg;

  factory ProfileRegisterModel.fromJson(Map<String, dynamic> json) =>
      ProfileRegisterModel(
        status: json["status"] ?? 0,
        msg: json["msg"] ?? "",
      );
}
