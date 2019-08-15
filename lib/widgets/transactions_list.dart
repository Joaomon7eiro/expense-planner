import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function deleteTransaction;

  TransactionList(this._transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: _transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Nenhuma transação registrada ate o momento',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                              'R\$${_transactions[index].amount.toStringAsFixed(2)}',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        '${_transactions[index].title}',
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        formatDate(
                            _transactions[index].date, [d, '/', m, '/', yyyy]),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            deleteTransaction(_transactions[index].id),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                },
                itemCount: _transactions.length,
              ),
      ),
    );
  }
}
