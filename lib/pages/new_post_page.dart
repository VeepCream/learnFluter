import 'package:flutter/material.dart';
import 'package:learn/provider/post_provider.dart';
import 'package:provider/provider.dart';

class NewsPostPage extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();
  final postMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สร้างโพสใหม่'),
      ),
      body: Form(
        key: fromKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (String text) {
                  if (text.isEmpty) {
                    return "กรุณากรอกข้อมูล";
                  }
                  if (text.length < 5) {
                    return "ข้อความต้องมีอักษรไม่น้อยกว่า 5 ตัว";
                  }
                  return null;
                },
                controller: postMessageController,
                autofocus: true,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'คุณกำลังทำอะไรอยู่'),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      child: Text('โพส'),
                      onPressed: () {
                        if (fromKey.currentState.validate()) {
                          var message = postMessageController.text;
                          var postProvider =
                              Provider.of<PostProvider>(context, listen: false);
                          postProvider.addNewPost(message);
                          Navigator.pop(context);
                        }
                      })),
            )
          ],
        ),
      ),
    );
  }
}
