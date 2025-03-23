import 'package:bloc_learning/data/models/user_odel.dart';
import 'package:bloc_learning/presentation/screens/login_screen.dart';
import 'package:bloc_learning/presentation/screens/postgres_users_screen.dart';
import 'package:bloc_learning/presentation/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';
import '../presentation/screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String postgresUser = '/postgres-user';
  static const String userDetail = '/user-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case userDetail:
        final user = settings.arguments as UserModel;
        return MaterialPageRoute(builder: (_) => UserDetailScreen(user: user));

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case postgresUser:
        return MaterialPageRoute(builder: (_) => PostgresUsersScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
