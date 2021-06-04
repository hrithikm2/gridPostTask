import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gridPost/models/post.dart';

class GridListItem extends StatelessWidget {
  final Post post;

  const GridListItem({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "https://picsum.photos/600/600"
            "?random=${post.id}",
        // height: MediaQuery.of(context).size.height*0.4,
        // width: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.contain
    ),
    );
  }
}
