part of app;

class DetailScreen extends StatefulWidget {
  final Item item;
  final bool favorite;

  const DetailScreen({
    Key key,
    @required this.item,
    @required this.favorite,
  })
      : assert(item != null),
        assert(favorite != null),
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
        tag: widget.item.title,
        child: Container(
          alignment: Alignment.center,
          width: width.value,
          height: heigth.value,
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child:
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
                                  widget.item.imageUrl,
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
                        Material(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(

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
                                          widget.item.title,
                                          style: TextStyle(
                                            fontFamily: 'KaushanScript',
                                            fontSize: 25.0,
                                            color: textColor,
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
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.item.text,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 15.0,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(

                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Ver en facebook",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 15.0,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.launch),
                                        color: Colors.grey,
                                        onPressed: () {
                                          _launchURL(widget.item.facebookUrl);
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

        ),
      ),
    );
  }

}
