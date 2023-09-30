import 'package:flutter/material.dart';
import 'package:my_finance/helper/database.dart';
import 'package:my_finance/screen/home/home.dart';
import 'package:my_finance/screen/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? userId = prefs.getInt("id");
  await initializeDatabase();
  runApp(MyApp(
    userId: userId,
  ));
}

class MyApp extends StatelessWidget {
  final int? userId;
  const MyApp({super.key, this.userId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: userId != null ? HomeScreen() : LoginScreen(),
    );
  }
}
