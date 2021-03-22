import 'package:sembast/sembast.dart';
import 'package:timeago/timeago.dart' as timeago;

class Post {
  String message;
  DateTime createdDate;
  Post({this.message, this.createdDate});

  String get timeagoMessage {
    DateTime now = DateTime.now();
    Duration duration = now.difference(this.createdDate);
    DateTime age = now.subtract(duration);
    String message = timeago.format(age, locale: 'th_short');

    return message;
  }

  static Map<String, dynamic> toJson(Post post) {
    return {
      'message': post.message,
      'createdDate': post.createdDate.toIso8601String()
    };
  }

  static formRecord(RecordSnapshot record) {
    var post = Post(
        message: record['message'],
        createdDate: DateTime.parse(record['createdDate']));
    return post;
  }
}
