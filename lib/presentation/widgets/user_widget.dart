import 'package:bloc_learning/data/models/down_lne_model.dart';
import 'package:bloc_learning/data/models/user_odel.dart';
import 'package:bloc_learning/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<DWLDatum> users;
  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.userDetail,
                arguments: users[index]);
          },
          title: Text(
            users[index].loginid,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
          subtitle: Text(
            users[index].sponsor,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        );
      },
    );
  }
}
