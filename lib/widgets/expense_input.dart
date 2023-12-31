import 'package:flutter/material.dart';
import 'package:expense_app/models/expense.dart';

class ExpenseInput extends StatefulWidget {
  ExpenseInput(this.addExpense, {super.key});
  final Function addExpense;

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

  Category _selectedCategory = Category.leisure;
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
                ),
              ],
            ),
            SizedBox(height: 15),
            DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toString().toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    _selectedCategory = value;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          final _amountValidation =
                              double.tryParse(_amountController.text);

                          if (_amountValidation == null ||
                              _amountValidation <= 0 ||
                              _titleController.text.trim().isEmpty ||
                              selectedDate == null) {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: const Text('Invalid Input'),
                                      content: const Text(
                                          "Please enter valid value for Title, Amount, Date"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok"))
                                      ],
                                    ));
                            return;
                          } else {
                            final data = Expense(
                                amount:
                                    double.tryParse(_amountController.text)!,
                                title: _titleController.text,
                                date: selectedDate!,
                                category: _selectedCategory);

                            widget.addExpense(data);

                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Save Expense"))),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")))
              ],
            )
          ],
        ));
  }
}
