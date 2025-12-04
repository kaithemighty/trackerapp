import 'package:flutter/material.dart';
import 'package:tracker/components/drawer.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:tracker/components/transaction_tile.dart';
import 'package:tracker/components/accounts_tile.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  final List<Map<String, String>> _transactions = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }
  Future<void> _loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedTransactions = prefs.getString('transactions');
    if (savedTransactions != null) {
      List<dynamic> decodedData = jsonDecode(savedTransactions);
      setState(() {
        _transactions.addAll(
          decodedData.map((transaction) {
            return {
              'amount': transaction['amount'].toString(),
              'date': transaction['date'].toString(),
            };
          }).toList(),
        );
      });
    }
  }

  Future<void> _saveTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("transactions", jsonEncode(_transactions));
  }

  void _addTransaction(String value) {
    if (value.isNotEmpty) {
      final transaction = {'amount': value, 'date': DateTime.now().toString()};
      setState(() {
        _transactions.add(transaction);
      });
      _saveTransactions();
      _controller.clear();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, 
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Net Worth"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Sparkline(
                data: data,
                fillMode: FillMode.below, 
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green.shade900, Theme.of(context).colorScheme.surface],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10, left: 172),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    "Accounts"
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 150,
              child: Column(),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text(
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                "Today's Transactions"
                ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  final transaction = _transactions[index];
                  return TransactionTile(
                    amount: transaction['amount']!,
                    date: transaction['date']!,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Enter Transaction Amount",
                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
                onSubmitted: _addTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
