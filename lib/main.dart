import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    title: 'My App',
    theme: ThemeData(primarySwatch: Colors.green),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
    ),
  );

  runApp(app);
}
