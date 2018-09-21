import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final String tag;
  final String title;
  final String text;
  final String imageUrl;
  final String facebookUrl;
  final bool favorite;

  const DetailScreen({
    Key key,
    @required this.tag,
    @required this.title,
    @required this.text,
    @required this.imageUrl,
    @required this.facebookUrl,
    @required this.favorite,
  })
      : assert(tag != null),
        assert(title != null),
        assert(text != null),
        assert(imageUrl != null),
        assert(favorite != null),
        assert(facebookUrl != null),
        super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {

  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  double _appBarHeight = 400.0;

  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.favorite;
    _containerController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    width = Tween<double>(
      begin: 200.0,
      end: 220.0,
    ).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth = new Tween<double>(
      begin: 400.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth.addListener(() {
      setState(() {
        if (heigth.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: widget.tag,
        child: Container(
          alignment: Alignment.center,
          width: width.value,
          height: heigth.value,
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              CustomScrollView(
                shrinkWrap: false,
                slivers: <Widget>[
                  SliverAppBar(
                    elevation: 0.0,
                    forceElevated: true,
                    leading: new IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: new Icon(
                        Icons.arrow_back,
                        color: Colors.deepPurple,
                        size: 30.0,
                      ),
                    ),
                    expandedHeight: _appBarHeight,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            height: _appBarHeight,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(
                                  widget.imageUrl,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.title,
                                          style: TextStyle(
                                            fontFamily: 'KaushanScript',
                                            fontSize: 25.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: (_isFavorited
                                              ? Icon(Icons.favorite)
                                              : Icon(Icons.favorite_border)),
                                          color: (_isFavorited
                                              ? Colors.pinkAccent
                                              : Colors.grey),
                                          onPressed: _toggleFavorite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.text,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Ver en facebook",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.launch),
                                        color: Colors.grey,
                                        onPressed: () {
                                          _launchURL(widget.facebookUrl);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
