import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CounterArea(),
    );
  }
}

class CounterArea extends StatefulWidget {
  CounterArea({Key key}) : super(key: key);

  @override
  _CounterAreaState createState() => _CounterAreaState();
}

class _CounterAreaState extends State<CounterArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(child: Text('hello, flutter')),
    );
  }
}
