import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Lunch",
        date: DateTime.now(),
        amount: 20.67,
        category: Category.food),
    Expense(
        title: "Movie",
        date: DateTime.now(),
        amount: 10.97,
        category: Category.leisure)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(children: [Text("Test Text")]),
    );
  }
}
