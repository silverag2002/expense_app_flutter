import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/screen_container.dart';
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
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          const Text("The chart"),
          Expanded(child: ScreenContainer(_registeredExpenses))
        ]));
  }
}
