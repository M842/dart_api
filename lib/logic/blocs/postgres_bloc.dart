import 'package:bloc_learning/data/repositories/postgres_respo.dart';
import 'package:bloc_learning/logic/events/postgres_event.dart';
import 'package:bloc_learning/logic/states/postgres_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/postgres_users_model.dart';

class PostgresBloc extends Bloc<PostgresEvent, PostgresState> {
  PostgresRepo postgresRepo;
  PostgresBloc({required this.postgresRepo}) : super(PostgresInit()) {
    on<FetchUsers>((event, emit) async {
      emit(PostgresLoading());
      try {
        List<PostgresUserList> users = await postgresRepo.getUsers();
        emit(PostgresLoaded(users));
      } catch (e) {
        print("ERROR$e");
        emit(PostgresError(e.toString()));
      }
    });
  }
}
