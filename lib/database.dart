import 'package:postgres/postgres.dart';

class DatabaseService {
  late PostgreSQLConnection connection;

  Future<void> connect() async {
    connection = PostgreSQLConnection(
      'localhost',
      5433,
      'postgres',
      username: 'postgres',
      password: '987654321!@',
    );
    await connection.open();
    print("✅ Database Connected!");
  }
}
