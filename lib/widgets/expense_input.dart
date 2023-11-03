import 'package:flutter/material.dart';
import 'package:expense_app/models/expense.dart';

class ExpenseInput extends StatefulWidget {
  State<ExpenseInput> createState() {
    return _ExpenseInputState();
  }
}

DateTime? selectedDate;

class _ExpenseInputState extends State<ExpenseInput> {
  var expenseTitle = '';
  // void _captureTitle(String inputValue) {
  //   expenseTitle = inputValue;
  // }
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  Widget build(context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Title")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLength: 50,
                    decoration: const InputDecoration(
                        label: Text("Amount"), prefixText: '\$'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    selectedDate == null
                        ? Text("No Date Selected")
                        : Text(format.format(selectedDate!)),
                    IconButton(
                        onPressed: () async {
                          final now = DateTime.now();
                          final firstDate =
                              DateTime(now.year - 1, now.month, now.day);

                          final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: firstDate,
                              lastDate: now);
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        },
                        icon: const Icon(Icons.calendar_month))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          print(_titleController.text);
                          print(_amountController.text);
                        },
                        child: Text("Save Expense"))),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: TextButton(
                        onPressed: () {
                          print(_titleController.text);
                        },
                        child: Text("Cancel")))
              ],
            )
          ],
        ));
  }
}
