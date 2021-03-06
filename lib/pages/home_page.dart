import 'package:flutter/material.dart';
import 'package:learn/models/post_model.dart';
import 'package:learn/provider/post_provider.dart';
import 'package:provider/provider.dart';

import 'new_post_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PostProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return NewsPostPage();
                        }));
              })
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (BuildContext context, PostProvider provider, Widget child) {
          return ListView.builder(
            itemCount: provider.posts.length,
            itemBuilder: (BuildContext context, int index) {
              Post post = provider.posts[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.timeagoMessage,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            post.message,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[350]),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           padding: EdgeInsets.all(10),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 '10 min ago',
      //                 style: TextStyle(color: Colors.grey[400]),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Text(
      //                 'สวัสดี โลก',
      //                 style: TextStyle(fontSize: 18),
      //               )
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //           child: Container(
      //             decoration: BoxDecoration(color: Colors.grey[350]),
      //           ),
      //         )
      //       ],
      //     );
      //   },
      // )
    );
  }
}
