import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 2,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    userTransactions[index].amount.toStringAsFixed(0),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        userTransactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Date: ' +
                                DateFormat.yMMMd()
                                    .format(userTransactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('   '),
                          Text(
                            'Time: ' +
                                DateFormat.Hm()
                                    .format(userTransactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                          // Text(tx.date.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
