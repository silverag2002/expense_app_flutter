import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.title, {super.key});
  final String title;
  @override
  Widget build(context) {
    return Text(title);
  }
}
