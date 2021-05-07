import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount > 0 && enteredTitle != null) {
      widget.addNewTransaction(enteredTitle, enteredAmount);
    }

    Navigator.of(context).pop();
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: submitData,
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
