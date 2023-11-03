import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final format = DateFormat.yMd();

enum Category { work, leisure, food, travel }

const categoryIcons = {
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
};
const uuid = Uuid();

class Expense {
  Expense(
      {required this.title,
      required this.date,
      required this.amount,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Category category;

  String get formatDate {
    return format.format(date);
  }
}
