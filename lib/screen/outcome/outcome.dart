// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/helper/currency.dart';

class OutcomeScreen extends StatefulWidget {
  const OutcomeScreen({Key? key}) : super(key: key);

  @override
  State<OutcomeScreen> createState() => _OutcomeScreenState();
}

class _OutcomeScreenState extends State<OutcomeScreen> {
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  TextEditingController _moneyController = TextEditingController();
  final Currency _currencyFormatter = Currency();

  TextEditingController _textController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Outcome"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Select Date',
                  suffixIcon: IconButton(
                    onPressed: () => _selectDate(context),
                    icon: Icon(Icons.calendar_today),
                  ),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _moneyController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  _currencyFormatter,
                ],
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  prefixText: 'Rp ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Information',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white, // Background color
                  ),
                  onPressed: () {
                    setState(() {
                      _dateController = TextEditingController();
                      _textController = TextEditingController();
                      _moneyController = TextEditingController();
                    });
                  },
                  child: Text('Reset'),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white, // Background color
                  ),
                  onPressed: () {},
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
