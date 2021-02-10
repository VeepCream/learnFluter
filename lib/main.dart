import 'package:flutter/material.dart';
import 'contact.dart';

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
    var contact = Contact("vee", "0827975507");
    return Scaffold(
        appBar: AppBar(
          title: Text("Nextflow Contact"),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${index + 1}'),
            );
          },
        ));
  }
}
