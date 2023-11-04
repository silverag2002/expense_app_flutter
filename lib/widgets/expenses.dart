import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/expense_input.dart';
import 'package:expense_app/widgets/screen_container.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

List<Expense> expenseData = [];

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense expense) {
    setState(() {
      expenseData.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      expenseData.remove(expense);
    });
  }

  void _openBottomModel() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => ExpenseInput(
              addExpense,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: const Text("Expense Tracker"), actions: [
          IconButton(onPressed: _openBottomModel, icon: const Icon(Icons.add))
        ]),
        body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(children: [
              const Text("The chart"),
              Expanded(child: ScreenContainer(expenseData, removeExpense))
            ]))));
  }
}
