part of app;

class TutorialsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenPadding),
        decoration: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, titlePaddingTop, 0.0, 20.0),
                  child: Text(
                    allTranslations.text('tutorials'),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            Flexible(
              child: StreamBuilder(
                stream: Firestore.instance.collection("tutorials").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return Text("Loading...");
                  return GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    padding: EdgeInsets.all(4.0),
                    childAspectRatio: 1.0,
                    children: List.generate(snapshot.data.documents.length, (index) {
                      return Tutorial(
                        item: Item.fromSnapshot(snapshot.data.documents[index]),
                      );
                    })
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class Tutorial extends StatelessWidget {

  final Item item;

  const Tutorial({
    Key key,
    @required this.item,
  })
    : assert(item != null),
      super(key: key);

  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          _launchURL(item.youtubeUrl);
        },
        child: Stack(
          children: <Widget>[
            Image.network(
              this.item.imageUrl,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black38,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            item.title,
            style: TextStyle(
              fontFamily: 'KaushanScript',
            ),
          ),
        ),
      ),
    );
  }
}