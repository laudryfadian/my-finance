import 'package:my_finance/helper/database.dart';
import 'package:my_finance/model/balance_detail.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addBalanceDetail(BalanceDetail balance) async {
  final Database db = await initializeDatabase();
  await db.insert(
    'balance_detail',
    balance.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
