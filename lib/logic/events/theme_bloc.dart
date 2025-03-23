import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// Define State
class ThemeState {
  final ThemeData themeData;
  ThemeState({required this.themeData});
}

// Define BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: ThemeData.light())) {
    on<ToggleTheme>((event, emit) {
      final isDarkMode = state.themeData.brightness == Brightness.dark;
      emit(ThemeState(themeData: isDarkMode ? ThemeData.light() : ThemeData.dark()));
    });
  }
}
