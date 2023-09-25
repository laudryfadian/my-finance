import 'package:my_finance/helper/database.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> authenticateUser(String email, String password) async {
  final Database db = await initializeDatabase();
  final List<Map<String, dynamic>> results = await db.query(
    'users',
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );

  return results.isNotEmpty;
}
