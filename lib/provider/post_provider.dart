import 'package:flutter/foundation.dart';
import 'package:learn/models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  addNewPost(String postMessage) {
    Post post = Post(message: postMessage, createdDate: DateTime.now());
    _posts.insert(0, post);

    notifyListeners();
  }
}
