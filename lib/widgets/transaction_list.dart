import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: FittedBox(
                      child: Text(userTransactions[index].amount.toString())),
                ),
              ),
              title: Text(
                userTransactions[index].title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(
                'Date : ' +
                    DateFormat.yMMMd().format(userTransactions[index].date) +
                    '   ',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  deleteTransaction(userTransactions[index].id);
                },
              ),
            ),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
