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
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('กดปุ่มถ้าต้องการเพิ่มตัวนับ'),
          Text(
            _counter.toString(),
            style: TextStyle(fontSize: 60, color: Colors.blue),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
