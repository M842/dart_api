import 'package:bloc_learning/data/models/postgres_users_model.dart';
import 'package:bloc_learning/utils/api_service.dart';

class PostgresRepo {
  Future<List<PostgresUserList>> getUsers() async {
    return await ApiService.postgresFetchUser();
  }
}
