import 'package:bloc_learning/logic/blocs/postgres_bloc.dart';
import 'package:bloc_learning/logic/events/postgres_event.dart';
import 'package:bloc_learning/logic/states/postgres_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostgresUsersScreen extends StatefulWidget {
  const PostgresUsersScreen({super.key});

  @override
  State<PostgresUsersScreen> createState() => _PostgresUsersScreenState();
}

class _PostgresUsersScreenState extends State<PostgresUsersScreen> {
  @override
  void initState() {
    context.read<PostgresBloc>().add(FetchUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postgres User List"),
      ),
      body: BlocBuilder<PostgresBloc, PostgresState>(builder: (context, state) {
        if (state is PostgresLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PostgresLoaded) {
          return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.users[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                  subtitle: Text(state.users[index].email,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black)),
                );
              });
        } else if (state is PostgresError) {
          return Text(
            state.error,
            style: TextStyle(color: Colors.black),
          );
        }
        return Container();
      }),
    );
  }
}
