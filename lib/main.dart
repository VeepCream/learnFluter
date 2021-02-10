import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> textWidgets = [];

    for (var i = 0; i < 10; i++) {
      var widget = Text('$i');
      textWidgets.add(widget);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Nextflow Contact"),
        ),
        body: Column(
          children: textWidgets,
        ));
  }
}
