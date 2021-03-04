import 'package:flutter/foundation.dart';

class PostProvider with ChangeNotifier {
  List<String> _posts = [];

  List<String> get posts => _posts;

  addNewPost(String post) {
    _posts.insert(0, post);

    notifyListeners();
  }
}
