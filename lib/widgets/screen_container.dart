import 'package:expense_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/expense.dart';

class ScreenContainer extends StatelessWidget {
  ScreenContainer(this.expensesData, this.removeExpense, {super.key});
  final Function removeExpense;
  final List<Expense> expensesData;
  @override
  Widget build(context) {
    return Container(
        child: ListView.builder(
            itemCount: expensesData.length,
            itemBuilder: (ctx, index) => Dismissible(
                onDismissed: (direction) =>
                    {removeExpense(expensesData[index])},
                key: ValueKey(expensesData[index]),
                child: ExpenseItem(expensesData[index]))));
  }
}
