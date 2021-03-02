import 'package:flutter/foundation.dart';

class PostProvider with ChangeNotifier {
  List<String> _post = [];

  List<String> get posts => _post;
}
