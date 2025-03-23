import 'package:bloc_learning/logic/blocs/auth_bloc.dart';
import 'package:bloc_learning/logic/events/auth_event.dart';
import 'package:bloc_learning/logic/states/auth_state.dart';
import 'package:bloc_learning/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var editEmailController = TextEditingController();
  var editPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: editEmailController,
              decoration: InputDecoration(hintText: "Email ID"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: editPasswordController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LoginUser(
                          email: editEmailController.text,
                          password: editPasswordController.text));
                    },
                    child: Text("Login")),
              );
            },
            listener: (context, state) {
              if (state is AuthInitSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Login Successful!")),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
