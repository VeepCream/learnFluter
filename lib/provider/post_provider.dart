import 'package:flutter/foundation.dart';
import 'package:learn/database/post_db.dart';
import 'package:learn/models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  addNewPost(String postMessage) async {
    Post post = Post(message: postMessage, createdDate: DateTime.now());
    var postDB = PostDB(databaseName: 'app.db');
    await postDB.save(post);
    var postFromDB = await postDB.loadAllPosts();

    _posts = postFromDB;
    notifyListeners();
  }

  initData() async {
    var postDB = PostDB(databaseName: 'app.db');
    var postFromDB = await postDB.loadAllPosts();

    _posts = postFromDB;
    notifyListeners();
  }

  clearAllPost() async {
    var postDB = PostDB(databaseName: 'app.db');
    var postFromDB = await postDB.clearPostData();

    List<Post> postsClear = [];
    _posts = postsClear;
    notifyListeners();
  }
}
