import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransactions;
  final Function deleteTx;

  const TransactionList(this.listTransactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: listTransactions.isEmpty ? Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 300,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],) : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                      child: Text('\$${listTransactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                listTransactions[index].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                  DateFormat.yMMMd().format(listTransactions[index].date)
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => deleteTx(listTransactions[index].id),
              ),
            ),
          );
        },
        itemCount: listTransactions.length,
      ),
    );
  }
}
