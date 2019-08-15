import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/transactions_list.dart';

import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<Transaction> _transactions = [];
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Padaria',
      amount: 16.64,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '5',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '6',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '7',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '8',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '9',
      title: 'Tênis',
      amount: 30.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount, DateTime dateTime) {
    final newTransaction = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: dateTime,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return NewTransaction(_addNewTransaction);
        });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_transactions, _deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
