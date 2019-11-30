part of app;

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, titlePaddingTop, 0.0, 0.0),
                  child: Text(
                    allTranslations.text('trending'),
                    style: titleTextStyle,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: StreamBuilder(
                  stream: Firestore.instance.collection("gallery").where("trending", isEqualTo: true).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            allTranslations.text('loading'),
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'KaushanScript',
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      );
                    }
                    return Row(
                      children: List.generate(snapshot.data.documents.length, (index) {
                        int last = snapshot.data.documents.length - 1;
                        return TrendingItem(
                          item: Item(
                            id: snapshot.data.documents[last - index].documentID,
                            imageUrl:  snapshot.data.documents[last - index]['image_url'],
                            text: snapshot.data.documents[last - index]['text'],
                            facebookUrl: snapshot.data.documents[last - index]['facebook_url'],
                            instagramUrl: snapshot.data.documents[last - index]['instagram_url'],
                            title: snapshot.data.documents[last - index]['title'],
                            tag: snapshot.data.documents[last - index].documentID + '_thumbnail',
                          ),
                          favorite: snapshot.data.documents[last - index]['users_favorite'].toString().contains(user.uid),
                        );
                      }),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );

  }

}
