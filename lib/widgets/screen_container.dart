import 'package:expense_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/expense.dart';

class ScreenContainer extends StatelessWidget {
  ScreenContainer(this.expenses, {super.key});
  final List<Expense> expenses;
  @override
  Widget build(context) {
    return Container(
        child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (ctx, index) => ExpenseItem(expenses[index])));
  }
}
