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
    final expIndex = expenseData.indexOf(expense);
    setState(() {
      expenseData.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                expenseData.insert(expIndex, expense);
              });
            }),
        content: Text("Expense Deleted")));
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("The chart"),
                  Expanded(child: ScreenContainer(expenseData, removeExpense))
                ]))));
  }
}
