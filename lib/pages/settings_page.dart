import 'package:flutter/material.dart';
import 'package:learn/provider/post_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("แน่ใจนะ?"),
                      content: Text('นี่จะเป็นการลบข้อมูลทั้งหมดในไทม์ไลน์'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<PostProvider>(context, listen: false)
                                .clearAllPost();
                            Navigator.pop(context);
                          },
                          child: Text('ยืนยัน'),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ยกเลิก'))
                      ],
                    );
                  });
            },
            child: Text('ลบข้อมูลทั้งหมด'),
          ),
        ),
      ),
    );
  }
}
