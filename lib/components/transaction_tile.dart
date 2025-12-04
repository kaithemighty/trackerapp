import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final String amount;
  final String date;

  const TransactionTile({
    super.key,
    required this.amount, 
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
    
    return ListTile(
      leading: Icon(Icons.money, color: Theme.of(context).colorScheme.inversePrimary),
      title: Text(
        "\$$amount",
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      subtitle: Text(
        formattedDate,
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      trailing: IconButton(
        icon: Icon(Icons.delete, 
        color: Theme.of(context).colorScheme.inversePrimary),
        onPressed: () {},
        ),
    );
  }
}