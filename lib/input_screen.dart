import 'package:flutter/material.dart';
import 'expense_model.dart';

class BudgetInputScreen extends StatefulWidget {
  const BudgetInputScreen({super.key});

  @override
  State<BudgetInputScreen> createState() => _BudgetInputScreenState();
}

class _BudgetInputScreenState extends State<BudgetInputScreen> {
  final _formKey = GlobalKey<FormState>();

  final _incomeController = TextEditingController();
  final _rentController = TextEditingController();
  final _foodController = TextEditingController();
  final _transportController = TextEditingController();
  final _othersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monthly Budget Form')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_incomeController, 'Monthly Income'),
              _buildTextField(_rentController, 'Rent / EMI'),
              _buildTextField(_foodController, 'Food Expenses'),
              _buildTextField(_transportController, 'Transport Expenses'),
              _buildTextField(_othersController, 'Other Expenses'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final expense = Expense(
                      income: double.parse(_incomeController.text),
                      rent: double.parse(_rentController.text),
                      food: double.parse(_foodController.text),
                      transport: double.parse(_transportController.text),
                      others: double.parse(_othersController.text),
                    );
                    Navigator.pushNamed(
                      context,
                      '/result',
                      arguments: expense,
                    );
                  }
                },
                child: const Text('Calculate & View Result >>'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter $label';
          }
          final val = double.tryParse(value);
          if (val == null || val < 0) {
            return 'Enter a valid number';
          }
          return null;
        },
      ),
    );
  }
}
