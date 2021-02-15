import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  final String title;
  final int total;
  final Color backgroundColor;

  const StatBox({Key key, this.title, this.total, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: backgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(
            child: Text(
              '${total ?? "0"}',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
