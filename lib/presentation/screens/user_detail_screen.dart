import 'package:bloc_learning/data/models/user_odel.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user.name}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("User ID: ${user.id}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
