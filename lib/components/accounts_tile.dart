import 'package:flutter/material.dart';

class AccountsTile extends StatelessWidget {
  final String tilename;
  final String amount;

  const AccountsTile({
    super.key,
    required this.tilename,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_balance, color: Theme.of(context).colorScheme.inversePrimary),
      title: Text(
        tilename,
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      subtitle: Text(
        amount,
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      trailing: Icon(Icons.delete, color: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}