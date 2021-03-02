import 'package:flutter/foundation.dart';

class PostProvider with ChangeNotifier {
  List<String> _post = [];

  List<String> get posts {
    return _post;
  }
}
