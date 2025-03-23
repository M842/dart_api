import 'package:bloc_learning/data/models/down_lne_model.dart';
import 'package:bloc_learning/data/repositories/user_repository.dart';
import 'package:bloc_learning/logic/events/user_event.dart';
import 'package:bloc_learning/logic/states/user_state.dart';
import 'package:bloc_learning/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GetDownLineTeamMethod>((event, emit) async {
      emit(UserLoading());
      try {
        ApiResponse response = await userRepository
            .getAllDownLine({"mregno": 1, "findlvl": 30, "idStatus": 1});
        DownLineListModel m = response.data;
        List<DWLDatum> users = m.response.data;
        final balance = await userRepository.getWalletBalance();
        emit(UserLoaded(users, balance));
      } catch (e) {
        print("ERROR$e");
        emit(UserError(e.toString()));
      }
    });
  }
}
