import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
    List<Contact> contactList = [
      Contact("vee", "0827975507", 'assets/images/nextflow.png'),
      Contact("emergency", "191", 'assets/images/error.png')
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Nextflow Contact"),
        ),
        body: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (BuildContext context, int index) {
            Contact contact = contactList[index];
            return ListTile(
              leading: Image.asset(contact.imageSource),
              title: Text(contact.name),
              subtitle: Text(contact.phoneNumber),
              onTap: () {
                launch('tel:${contact.phoneNumber}');
              },
            );
          },
        ));
  }
}
