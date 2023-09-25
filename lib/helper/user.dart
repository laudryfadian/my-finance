import 'package:my_finance/helper/database.dart';
import 'package:my_finance/model/user.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addUser(User user) async {
  final Database db = await initializeDatabase();
  await db.insert(
    'users',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
