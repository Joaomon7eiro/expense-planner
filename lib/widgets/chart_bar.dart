import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalSpending;
  final double spendingPercent;

  ChartBar({this.label, this.totalSpending, this.spendingPercent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('R\$${totalSpending.toStringAsFixed(0)}'),
        Container(
          height: 60,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.grey,
              ),
              FractionallySizedBox(
                heightFactor: spendingPercent,
                child: Container(
                  color: Colors.amber,
                ),
              )
            ],
          ),
        ),
        Text('$label')
      ],
    );
  }
}
