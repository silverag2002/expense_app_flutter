import 'package:flutter/material.dart';
import 'package:expense_app/models/expense.dart';

class ScreenContainer extends StatelessWidget {
  ScreenContainer(this.expenses, {super.key});
  final List<Expense> expenses;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: const Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              Center(child: Text("Hello")),
              Center(child: Text("Ankit"))
            ],
          )),
    );
  }
}
