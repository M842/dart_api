import 'package:bloc_learning/data/models/postgres_users_model.dart';

abstract class PostgresState {}

class PostgresInit extends PostgresState {}

class PostgresLoading extends PostgresState {}

class PostgresLoaded extends PostgresState {
  List<PostgresUserList> users;
  PostgresLoaded(this.users);
}

class PostgresError extends PostgresState {
  String error;
  PostgresError(this.error);
}
