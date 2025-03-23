import 'package:bloc_learning/data/models/user_odel.dart';
import 'package:bloc_learning/utils/api_service.dart';

class UserRepository {
  Future<List<UserModel>> getUsers() async {
    return await ApiService.fetchUser();
  }

  Future<String> getWalletBalance() async {
    return await ApiService.getWalletBalanceApi();
  }

  Future<ApiResponse> getAllDownLine(Map params) async {
    return await ApiService().getAllDownLineApi(params);
  }
}
