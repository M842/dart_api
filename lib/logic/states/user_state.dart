import 'package:bloc_learning/data/models/down_lne_model.dart';
import 'package:bloc_learning/data/models/user_odel.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<DWLDatum> users;

  final String availableBalance;

  UserLoaded(this.users, this.availableBalance);
}

class WalletBalanceLoaded extends UserState {
  final String availableBalance;
  WalletBalanceLoaded(this.availableBalance);
}

class UserError extends UserState {
  final String error;
  UserError(this.error);
}
