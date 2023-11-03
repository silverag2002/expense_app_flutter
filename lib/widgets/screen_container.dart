import 'package:expense_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/expense.dart';

class ScreenContainer extends StatelessWidget {
  ScreenContainer(this.expensesData, {super.key});
  final List<Expense> expensesData;
  @override
  Widget build(context) {
    return Container(
        child: ListView.builder(
            itemCount: expensesData.length,
            itemBuilder: (ctx, index) => ExpenseItem(expensesData[index])));
  }
}
