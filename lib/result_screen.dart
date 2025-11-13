import 'package:flutter/material.dart';
import 'expense_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expense = ModalRoute.of(context)!.settings.arguments as Expense;

    final totalExpenses = expense.rent + expense.food + expense.transport + expense.others;
    final remaining = expense.income - totalExpenses;

    final isNegative = remaining < 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Summary'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildItem('Monthly Income', expense.income),
                _buildItem('Rent / EMI', expense.rent),
                _buildItem('Food', expense.food),
                _buildItem('Transport', expense.transport),
                _buildItem('Others', expense.others),
                const Divider(thickness: 2),
                _buildItem('Remaining Balance', remaining,
                    color: isNegative ? Colors.red : Colors.green),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    isNegative
                        ? '⚠️ You are overspending!'
                        : '✅ Great! You are saving money!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isNegative ? Colors.red : Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String label, double value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            '₹${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
