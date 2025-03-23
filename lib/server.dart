import 'dart:convert';
import 'dart:io';

import 'package:bloc_learning/database.dart';
import 'package:shelf/shelf.dart';

import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

main() async {
  final database = DatabaseService();
  await database.connect();

  final app = Router();
  app.get("/users", (Request req) async {
    final result = await database.connection.query("Select * from users");
    final users = result
        .map((row) => {'id': row[0], 'name': row[1], 'email': row[2]})
        .toList();
    return Response.ok(jsonEncode(users),
        headers: {'Content-Type': 'application/json'});
  });
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);
  final server = await io.serve(handler, 'localhost', 8080);
  print('✅ Server running on http://${server.address.host}:${server.port}/users');
}
