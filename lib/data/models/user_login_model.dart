


import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String resutl;
  Response response;

  LoginModel({
    required this.resutl,
    required this.response,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    resutl: json["resutl"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "resutl": resutl,
    "response": response.toJson(),
  };
}

class Response {
  bool loginEdit;
  dynamic phone;
  bool active;
  String mobile;
  String name;
  int kid;
  String emailId;
  String uPhoto;
  int regno;
  String loginid;
  String password;
  String epassword;
  int rlevel;
  DateTime lastLogin;
  dynamic secretQid;
  dynamic secretAns;
  int emailVerified;
  String address;

  Response({
    required this.loginEdit,
    required this.phone,
    required this.active,
    required this.mobile,
    required this.name,
    required this.kid,
    required this.emailId,
    required this.uPhoto,
    required this.regno,
    required this.loginid,
    required this.password,
    required this.epassword,
    required this.rlevel,
    required this.lastLogin,
    required this.secretQid,
    required this.secretAns,
    required this.emailVerified,
    required this.address,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    loginEdit: json["loginEdit"],
    phone: json["phone"],
    active: json["Active"],
    mobile: json["mobile"],
    name: json["name"],
    kid: json["kid"],
    emailId: json["EmailID"],
    uPhoto: json["uPhoto"],
    regno: json["Regno"],
    loginid: json["loginid"],
    password: json["Password"],
    epassword: json["epassword"],
    rlevel: json["Rlevel"],
    lastLogin: DateTime.parse(json["lastLogin"]),
    secretQid: json["Secret_qid"],
    secretAns: json["Secret_ans"],
    emailVerified: json["EmailVerified"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "loginEdit": loginEdit,
    "phone": phone,
    "Active": active,
    "mobile": mobile,
    "name": name,
    "kid": kid,
    "EmailID": emailId,
    "uPhoto": uPhoto,
    "Regno": regno,
    "loginid": loginid,
    "Password": password,
    "epassword": epassword,
    "Rlevel": rlevel,
    "lastLogin": lastLogin.toIso8601String(),
    "Secret_qid": secretQid,
    "Secret_ans": secretAns,
    "EmailVerified": emailVerified,
    "address": address,
  };
}
