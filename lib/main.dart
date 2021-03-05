import 'package:flutter/material.dart';
import 'package:learn/pages/new_post_page.dart';
import 'package:learn/provider/post_provider.dart';
import 'package:provider/provider.dart';
import 'models/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  timeago.setLocaleMessages('th', timeago.ThMessages());
  timeago.setLocaleMessages('th_short', timeago.ThShortMessages());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => PostProvider())
      ],
      child: MaterialApp(
        title: 'Nextflow Personal Post',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Personal Post'),
      ),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
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
                  Container(
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
