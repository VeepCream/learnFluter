import 'package:flutter/material.dart';

class NewsPostPage extends StatelessWidget {
  const NewsPostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สร้างโพสใหม่'),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(),
          RaisedButton(child: Text('โพส'), onPressed: () {})
        ],
      ),
    );
  }
}
