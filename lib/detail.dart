import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  final String tag;
  final String title;

  const DetailScreen({
    Key key,
    @required this.tag,
    @required this.title,
  })
      : assert(tag != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: GestureDetector(
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: this.tag,
                child: Image.asset(
                  this.tag,
                ),
              ),
            ),
            Positioned(
              right: 10.0,
              top: 40.0,
              child: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ]
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

}
