import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
              controller: titleInputController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Preço'),
              controller: amountInputController,
            ),
            FlatButton(
              child: Text('Adicionar Transação'),
              onPressed: () {
                addNewTransaction(titleInputController.text,
                    double.parse(amountInputController.text));
              },
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
