import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount > 0 && enteredTitle != null) {
      widget.addNewTransaction(
        enteredTitle,
        enteredAmount,
        selectedDate,
      );
    }
    if (selectedDate == null) {
      final snackbar = new SnackBar(content: Text('Choose a date'));
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);
    }

    Navigator.of(context).pop();
  }

  void openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return null;
      } else {
        setState(() {
          selectedDate = value;
        });
      }
      return selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  // onChanged: (title) {
                  //   titleInput = title;
                  // },
                  controller: titleController,
                  style: TextStyle(fontSize: 18),
                  onSubmitted: (_) => submitData(),
                  decoration: new InputDecoration(labelText: 'Title'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  // onChanged: (amount) {
                  //   amountInput = amount;
                  // },
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  style: TextStyle(fontSize: 18),
                  decoration: new InputDecoration(labelText: 'Amount'),
                  onSubmitted: (_) => submitData(),
                ),
              ),
              Row(
                children: [
                  Text((selectedDate == null)
                      ? 'No Date Chose'
                      : DateFormat.yMMMd().format(selectedDate)),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: openDatePicker, child: Text('Chose Date'))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: submitData,
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
