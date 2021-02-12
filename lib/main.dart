import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn/covid_today_result.dart';
import 'dart:developer' as dev;

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
  CovidTodayResult _dataFromWebAPI;

  @override
  void initState() {
    super.initState();

    print('init state');
    getData();
  }

  Future<void> getData() async {
    var response = await http.get('https://covid19.th-stat.com/api/open/today');

    setState(() {
      _dataFromWebAPI = covidTodayResultFromJson(response.body);
      dev.log(_dataFromWebAPI.toJson().toString());
      print("test");
    });
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
              subtitle: Text('${_dataFromWebAPI?.confirmed ?? "0"}'),
            ),
            ListTile(
              title: Text('หายแล้ว'),
              subtitle: Text('${_dataFromWebAPI?.recovered ?? "0"}'),
            ),
            ListTile(
              title: Text('รักษาอยู่ในโรงพยาบาล'),
              subtitle: Text('${_dataFromWebAPI?.hospitalized ?? "0"}'),
            ),
            ListTile(
              title: Text('เสียชีวิต'),
              subtitle: Text('${_dataFromWebAPI?.deaths ?? "0"}'),
            )
          ],
        ));
  }
}
