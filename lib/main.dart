import 'package:flutter/material.dart';
import 'input_screen.dart';
import 'result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monthly Expense Manager',
      initialRoute: '/',
      routes: {
        '/': (context) => BudgetInputScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}
