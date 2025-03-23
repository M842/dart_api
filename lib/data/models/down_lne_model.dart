


import 'dart:convert';

DownLineListModel downLineListModelFromJson(String str) =>
    DownLineListModel.fromJson(json.decode(str));

String downLineListModelToJson(DownLineListModel data) =>
    json.encode(data.toJson());

class DownLineListModel {
  String result;
  Response response;

  DownLineListModel({
    required this.result,
    required this.response,
  });

  factory DownLineListModel.fromJson(Map<String, dynamic> json) =>
      DownLineListModel(
        result: json["result"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
    "result": result,
    "response": response.toJson(),
  };
}

class Response {
  List<DWLDatum> data;

  Response({
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    data:
    List<DWLDatum>.from(json["data"].map((x) => DWLDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DWLDatum {
  String sponsor;
  dynamic regNo;
  String loginid;
  dynamic name;
  dynamic regdate;
  String mobile;
  dynamic status;
  dynamic topupDate;
  dynamic totalcoin;
  dynamic kitPrice;
  dynamic teambusiness;

  DWLDatum({
    required this.sponsor,
    required this.regNo,
    required this.loginid,
    required this.name,
    required this.regdate,
    required this.mobile,
    required this.status,
    required this.topupDate,
    required this.totalcoin,
    required this.kitPrice,
    required this.teambusiness,
  });

  factory DWLDatum.fromJson(Map<String, dynamic> json) => DWLDatum(
    sponsor: json["Sponsor"]!,
    regNo: json["regno"],
    loginid: json["loginid"],
    name: json["Name"]!,
    regdate: json["regdate"],
    mobile: json["Mobile"],
    status: json["STATUS"]!,
    topupDate: json["TopupDate"]!,
    totalcoin: json["totalcoin"],
    kitPrice: json["kitPrice"],
    teambusiness: json["teambusiness"],
  );

  Map<String, dynamic> toJson() => {
    "Sponsor": sponsor,
    "loginid": loginid,
    "regno": regNo,
    "Name": name,
    "regdate": regdate.toIso8601String(),
    "Mobile": mobile,
    "STATUS": status,
    "TopupDate": topupDate,
    "totalcoin": totalcoin,
    "kitPrice": kitPrice,
    "teambusiness": teambusiness,
  };
}

enum Name { ABDUL, JIT, KISHOR, NAME_ABDUL, RAJU, TEST }

final nameValues = EnumValues({
  "Abdul ": Name.ABDUL,
  "Jit ": Name.JIT,
  "Kishor ": Name.KISHOR,
  "abdul ": Name.NAME_ABDUL,
  "Raju ": Name.RAJU,
  "Test ": Name.TEST
});

enum Sponsor { MANGO, MFX645927 }

final sponsorValues =
EnumValues({"Mango": Sponsor.MANGO, "MFX645927": Sponsor.MFX645927});

enum Status { GREEN, RED }

final statusValues = EnumValues({"GREEN": Status.GREEN, "RED": Status.RED});

enum TopupDate { EMPTY, THE_27022025 }

final topupDateValues =
EnumValues({" ": TopupDate.EMPTY, "27/02/2025": TopupDate.THE_27022025});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}