import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      child: Column(children: [
        Text(expense.title),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text("\$${expense.amount.toStringAsFixed(2)}"),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.alarm),
                const SizedBox(
                  width: 8,
                ),
                Text(expense.date.toString())
              ],
            )
          ],
        )
      ]),
    );
  }
}
