import 'package:bloc_learning/logic/events/auth_event.dart';
import 'package:bloc_learning/logic/states/auth_state.dart';
import 'package:bloc_learning/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInit()) {
    on<LoginUser>(loginUser);
  }
  loginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    ApiResponse response = await ApiService().loginApi({
      "loginId": event.email,
      "password": event.password,
    });
    if (response.status) {
      AuthInitSuccess(response.data.response.loginid);
    } else {
      AuthFailure(response.message!);
    }
  }
}
