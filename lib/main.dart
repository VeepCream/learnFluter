import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn/covid_today_result.dart';
import 'dart:developer' as dev;

import 'package:learn/stat_box.dart';

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

  Future<CovidTodayResult> getData() async {
    var response = await http.get('https://covid19.th-stat.com/api/open/today');

    var result = covidTodayResultFromJson(response.body);
    // _dataFromWebAPI = covidTodayResultFromJson(response.body);
    //dev.log(_dataFromWebAPI.toJson().toString());
    print("test");

    return result;
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: FutureBuilder(
        future: getData(),
        builder:
            (BuildContext context, AsyncSnapshot<CovidTodayResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  StatBox(
                    title: 'ผู้ติดเชื้อสะสม',
                    total: result?.confirmed,
                    backgroundColor: Color(0xff77007c),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StatBox(
                    title: 'หายแล้ว',
                    total: result?.recovered,
                    backgroundColor: Color(0xff036233),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StatBox(
                    title: 'รักษาอยู่ในโรงพยาบาล',
                    total: result?.hospitalized,
                    backgroundColor: Color(0xff00B4B4),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StatBox(
                    title: 'เสียชีวิต',
                    total: result?.deaths,
                    backgroundColor: Color(0xff777777),
                  ),
                ],
              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
      // body: Column(
      //   children: <Widget>[
      //     indicator ?? Container(),
      //     Expanded(
      //         child: ListView(
      //       children: <Widget>[
      //         ListTile(
      //           title: Text('ผู้ติดเชื้อสะสม'),
      //           subtitle: Text('${_dataFromWebAPI?.confirmed ?? "0"}'),
      //         ),
      //         ListTile(
      //           title: Text('หายแล้ว'),
      //           subtitle: Text('${_dataFromWebAPI?.recovered ?? "0"}'),
      //         ),
      //         ListTile(
      //           title: Text('รักษาอยู่ในโรงพยาบาล'),
      //           subtitle: Text('${_dataFromWebAPI?.hospitalized ?? "0"}'),
      //         ),
      //         ListTile(
      //           title: Text('เสียชีวิต'),
      //           subtitle: Text('${_dataFromWebAPI?.deaths ?? "0"}'),
      //         )
      //       ],
      //     )),
      //   ],
      // )
    );
  }
}
