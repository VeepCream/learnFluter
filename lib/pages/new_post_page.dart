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
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(child: Text('โพส'), onPressed: () {})),
          )
        ],
      ),
    );
  }
}
