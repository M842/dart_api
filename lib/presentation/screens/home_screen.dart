import 'package:bloc_learning/data/models/user_odel.dart';
import 'package:bloc_learning/logic/blocs/user_bloc.dart';
import 'package:bloc_learning/logic/events/theme_bloc.dart';
import 'package:bloc_learning/logic/events/user_event.dart';
import 'package:bloc_learning/logic/states/user_state.dart';
import 'package:bloc_learning/presentation/widgets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print("🔹 FetchUsers event added to BLoC!");
    context.read<UserBloc>().add(GetDownLineTeamMethod());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeBloc>().add(ToggleTheme()),
        child: Icon(Icons.brightness_6),
      ),
      appBar: AppBar(title: Text('User List (BLoC)')),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Available Balance: ${state.availableBalance.toString()}",
                style: TextStyle(color: Colors.black),
              ),
              Flexible(child: UserList(users: state.users)),
            ],
          );
        } else if (state is UserError) {
          return Text(
            state.error,
            style: TextStyle(color: Colors.black),
          );
        }
        return Center(child: Text("Press button to load users"));
      }),
    );
  }
}
