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
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {

  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  double _appBarHeight = 400.0;

  @override
  void initState() {
    super.initState();
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
                        color: Colors.cyan,
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
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.grey,
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
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
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
                                      Icon(
                                        Icons.launch,
                                        color: Colors.grey,
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

      /**Scaffold(
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
    );*/
  }

}
