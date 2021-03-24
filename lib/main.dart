import 'package:flutter/material.dart';
import 'package:learn/pages/new_post_page.dart';
import 'package:learn/pages/settings_page.dart';
import 'package:learn/provider/post_provider.dart';
import 'package:provider/provider.dart';
import 'models/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'pages/home_page.dart';

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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [HomePage(title: 'Timeline'), SettingsPage()],
          ),
          backgroundColor: Colors.blue,
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'timeline',
              ),
              Tab(icon: Icon(Icons.settings), text: 'settings')
            ],
          ),
        ));
    //return HomePage(title: 'Timeline');
  }
}
