
// To parse this JSON data, do
//
//     final postgresUserList = postgresUserListFromJson(jsonString);

import 'dart:convert';

List<PostgresUserList> postgresUserListFromJson(String str) => List<PostgresUserList>.from(json.decode(str).map((x) => PostgresUserList.fromJson(x)));

String postgresUserListToJson(List<PostgresUserList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostgresUserList {
  int id;
  String name;
  String email;

  PostgresUserList({
    required this.id,
    required this.name,
    required this.email,
  });

  factory PostgresUserList.fromJson(Map<String, dynamic> json) => PostgresUserList(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
  };
}
