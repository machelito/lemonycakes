import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String tag;
  final String title;
  final String imageUrl;

  const DetailScreen({
    Key key,
    @required this.tag,
    @required this.title,
    @required this.imageUrl,
  })
      : assert(tag != null),
        assert(title != null),
        assert(imageUrl != null),
        super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7c94b6),
      body: GestureDetector(
        child: Stack(
          children: [
            Hero(
              tag: widget.tag,
              child: Image.network(
                widget.imageUrl,
              ),
            ),
          ]
        ),
      ),
    );
  }

}
