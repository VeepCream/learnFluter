import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow COVID-19 Today',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Nextflow COVID-19 Today'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    print('init state');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('ผู้ติดเชื้อสะสม'),
              subtitle: Text('0'),
            ),
            ListTile(
              title: Text('หายแล้ว'),
              subtitle: Text('0'),
            ),
            ListTile(
              title: Text('รักษาอยู่ในโรงพยาบาล'),
              subtitle: Text('0'),
            ),
            ListTile(
              title: Text('เสียชีวิต'),
              subtitle: Text('0'),
            )
          ],
        ));
  }
}
