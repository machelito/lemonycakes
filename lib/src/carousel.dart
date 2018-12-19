part of app;

class Carousel extends StatefulWidget {
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
      viewportFraction: 0.72,
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
      backgroundColor: Colors.transparent,
      body: StreamBuilder(
        stream: Firestore.instance.collection("gallery").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Text(
                  allTranslations.text('loading'),
                  style: TextStyle(
                      fontFamily: 'KaushanScript',
                      fontSize: 25.0,
                      color: Colors.white),
                ),
              ),
            );
          }
          if (snapshot.data.documents.length == 0) {
            return Container(
              child: Center(
                child: Text(
                  'No hay elementos para mostrar',
                  style: TextStyle(
                      fontFamily: 'KaushanScript',
                      fontSize: 25.0,
                      color: Colors.white),
                ),
              ),
            );
          }
          return PageView.builder(
            itemCount: snapshot.data.documents.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: controller,
            itemBuilder: (context, index) {
              int invertedIndex = snapshot.data.documents.length - index - 1;
              DocumentSnapshot ds = snapshot.data.documents[invertedIndex];
              return AnimatedBuilder(
                animation: controller,
                child: AnimatedItem(
                  item: Item.fromSnapshot(ds),
                  favorite: ds['users_favorite'].toString().contains(user.uid),
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

  final Item item;
  final bool favorite;

  const AnimatedItem({
    Key key,
    @required this.item,
    @required this.favorite,
  })
    : assert(item != null),
      super(key: key);


  @override
  _AnimatedItemState createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem> {

  bool _isFavorite;
  DocumentReference documentReference;
  List<String> usersFavorite;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      if(_isFavorite) {
        usersFavorite.add(user.uid);
      } else {
        usersFavorite.remove(user.uid);
      }
      print(usersFavorite);
      documentReference.updateData(
        {
          "users_favorite" : usersFavorite,
        }
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.favorite;
    documentReference = Firestore.instance.document("gallery/"+widget.item.id);
    documentReference.get().then((snapshot) {
      usersFavorite = List<String>.from(snapshot['users_favorite']);
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
                  tag: widget.item.tag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.item.imageUrl,
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
                    widget.item.title,
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
                  icon: (_isFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border)),
                  color: (_isFavorite
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
          return Backdrop(
            item: widget.item,
            favorite: _isFavorite,
          );
        }));
      },
    );
  }
}