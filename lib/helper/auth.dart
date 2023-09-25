import 'package:my_finance/helper/balance.dart';
import 'package:my_finance/helper/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> authenticateUser(String email, String password) async {
  print("masuk");
  final Database db = await initializeDatabase();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<Map<String, dynamic>> results = await db.query(
    'users',
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );

  if (results.isNotEmpty) {
    var id = results[0]['id'];
    await prefs.setInt('id', id);
  }

  await getBalanceByIdUser(results[0]['id']);

  return results.isNotEmpty;
}

Future<bool> checkEmail(String email) async {
  final Database db = await initializeDatabase();
  final List<Map<String, dynamic>> results = await db.query(
    'users',
    where: 'email = ?',
    whereArgs: [email],
  );

//ada = isNotEmpty (true)
  return results.isNotEmpty;
}
