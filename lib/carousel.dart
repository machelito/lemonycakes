import 'package:flutter/material.dart';
import 'package:lemonycakes/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Carousel extends StatefulWidget {

  final String category;

  const Carousel({
    Key key,
    @required this.category,
  })
    : assert(category != null),
      super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.75,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7c94b6),
      body: StreamBuilder(
        stream: Firestore.instance.collection(widget.category).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Text(
                  'Cargando...',
                  style: TextStyle(
                      fontFamily: 'KaushanScript',
                      fontSize: 25.0,
                      color: Colors.white),
                ),
              ),
            );
          }
          return new PageView.builder(
            itemCount: snapshot.data.documents.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: controller,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              return AnimatedBuilder(
                animation: controller,
                child: AnimatedItem(
                  ds: ds,
                ),
                builder: (context, child) {
                  double value = 1.0;
                  if (controller.position.haveDimensions) {
                    value = controller.page - index;
                  } else {
                    value = currentPage.toDouble() - index;
                  }
                  value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);

                  return Center(
                    child: SizedBox(
                      height: Curves.easeOut.transform(value) * 360,
                      width: Curves.easeOut.transform(value) * 270,
                      child: child,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class AnimatedItem extends StatefulWidget {

  final DocumentSnapshot ds;

  const AnimatedItem({
    Key key,
    @required this.ds,
  })
      : assert(ds != null),
        super(key: key);


  @override
  _AnimatedItemState createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem> {

  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: <Widget>[
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Hero(
                  tag: widget.ds['name'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.ds['image_url'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    widget.ds['name'],
                    style: TextStyle(
                        fontFamily: 'KaushanScript',
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: (_isFavorited
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border)),
                  color: (_isFavorited
                      ? Colors.pinkAccent
                      : Colors.white),
                  onPressed: _toggleFavorite,
                ),
              ),
            ],
          ),
        ),
      ]),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return DetailScreen(
            tag: widget.ds['name'],
            title: widget.ds['name'],
            imageUrl: widget.ds['image_url'],
            facebookUrl: widget.ds['facebook_url'],
            text: widget.ds['text'],
            favorite: _isFavorited,
          );
        }));
      },
    );
  }
}