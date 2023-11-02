import 'package:expense_app/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/widgets/screen_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Expense Tracker"), actions: [
            IconButton(
                onPressed: () {
                  print("PRinted");
                },
                icon: const Icon(Icons.add))
          ]),
          body: Expenses()),
    ),
  );
}
