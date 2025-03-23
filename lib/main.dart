import 'dart:io';

import 'package:bloc_learning/data/repositories/postgres_respo.dart';
import 'package:bloc_learning/data/repositories/user_repository.dart';
import 'package:bloc_learning/logic/blocs/postgres_bloc.dart';
import 'package:bloc_learning/logic/blocs/user_bloc.dart';
import 'package:bloc_learning/logic/events/theme_bloc.dart';
import 'package:bloc_learning/presentation/screens/home_screen.dart';
import 'package:bloc_learning/routes/app_routes.dart';
import 'package:bloc_learning/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UserBloc(userRepository: UserRepository())),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
            create: (context) => PostgresBloc(postgresRepo: PostgresRepo())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bloc',
          theme: state.themeData,
          initialRoute: AppRoutes.postgresUser,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
