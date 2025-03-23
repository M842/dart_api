import 'dart:convert';

import 'package:bloc_learning/data/models/down_lne_model.dart';
import 'package:bloc_learning/data/models/postgres_users_model.dart';
import 'package:bloc_learning/data/models/user_login_model.dart';
import 'package:bloc_learning/data/models/user_odel.dart';
import 'package:http/http.dart' as http;

const String BASE2 = 'http://api.mangofx.online/api/';
const String AUTH = "${BASE2}Auth/";
const String DASHBOARD = "${BASE2}Dashboard/";
const String DEPOSIT = "${BASE2}DepositReport/";
const String INCOME = "${BASE2}IncomePayout/";
//Auth
const String GET_ALL_COUNTRY_URL = "${AUTH}GetAllCountries";
const String REGSITER_URL = "${AUTH}Register";
const String UPDATE_PROFILE_URL = "${AUTH}UpdateProfile";
const String GET_PROFILE_URL = "${AUTH}ProfileDetails";
const String LOGIN_URL = "${AUTH}Login";
const String GET_USER_DETAIL_BY_ID_URL = "${AUTH}UserDetailsById";
const String UPDATE_PASSWORD_URL = "${AUTH}UpdatePassword";
const String FORGOT_PASSWORD_URL = "${AUTH}ForgetPassword";
const String MEMBER_REWARD_URL = "${AUTH}MemberRewardList";
//DashBoard
const String DASHBOARD_DETAIL_URL = "${DASHBOARD}Dashboard";
const String INVESTMENT_URL = "${DASHBOARD}Investment";
const String SELF_TRADING_HISTORY_URL = "${DASHBOARD}SelfTradingHistory";
const String DOWNLINE_TEAM_DETAIL_URL = "${DASHBOARD}DownLineTeam";
const String TREEVIEW_URL = "${DASHBOARD}TreeView";
const String TEAM_TRADING_HISTORY_URL = "${DASHBOARD}TeamTradingHistory";
const String ROI_REPORT_URL = "${DASHBOARD}ROIReport";

Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

class ApiService {
  static Future<List<UserModel>> fetchUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<String> getWalletBalanceApi() async {
    final response = await http
        .get(Uri.parse('http://api.mangofx.online/api/IncomePayout/balance/1'));

    Map data = json.decode(response.body);
    if (data["result"] == "true") {
      final balance = data["response"]["data"][0]["TopupWallet"].toString();
      return balance;
    } else {
      throw Exception(data["message"]);
    }
  }

  Future<ApiResponse> getAllDownLineApi(Map params) async {
    try {
      print(DOWNLINE_TEAM_DETAIL_URL);
      final response = await http.post(Uri.parse(DOWNLINE_TEAM_DETAIL_URL),
          body: json.encode(params), headers: headers);

      Map data = jsonDecode(response.body);

      print("DOWNLINE_TEAM_DETAIL_URL$data $params");
      if (data["result"] != "ERROR") {
        DownLineListModel m = downLineListModelFromJson(response.body);
        return ApiResponse(status: true, data: m, message: "SUCCESS");
      } else {
        return ApiResponse(status: false, data: null, message: "ERROR");
      }
    } catch (e) {
      print("DOWNLINE_TEAM_DETAIL_ERROR${e.toString()}");
      return ApiResponse(status: false, data: null, message: e.toString());
    }
  }

  Future<ApiResponse> loginApi(Map params) async {
    try {
      print(REGSITER_URL);
      final response = await http.post(Uri.parse(LOGIN_URL),
          body: json.encode(params), headers: headers);

      Map data = jsonDecode(response.body);

      print("LOGIN_URL$data");
      if (data["result"] != "false") {
        LoginModel m = loginModelFromJson(response.body);
        return ApiResponse(status: true, data: m, message: "SUCCESS");
      } else {
        return ApiResponse(status: false, data: null, message: data["message"]);
      }
    } catch (e) {
      print("LOGIN_URL_ERROR${e.toString()}");
      return ApiResponse(status: false, data: null, message: e.toString());
    }
  }

  static Future<List<PostgresUserList>> postgresFetchUser() async {
    final response =
        await http.get(Uri.parse('http://localhost:8081/users'));

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data = json.decode(response.body);
      print(data);
      return data.map((json) => PostgresUserList.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

class ApiResponse {
  bool status;
  String? message;
  dynamic data;
  ApiResponse({required this.status, this.message, this.data});
}
