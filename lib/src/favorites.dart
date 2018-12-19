part of app;

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

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
                  padding: EdgeInsets.fromLTRB(0.0, titlePaddingTop, 0.0, 0.0),
                  child: Text(
                    allTranslations.text('favorites'),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            Flexible(
              child: StreamBuilder(
                stream: Firestore.instance.collection("gallery").where("users_favorite", arrayContains: user.uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return Text(allTranslations.text('loading'));
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Favorite(
                        item: Item.fromSnapshot(snapshot.data.documents[index]),
                      );
                    },
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

class Favorite extends StatelessWidget {

  final Item item;

  const Favorite({
    Key key,
    @required this.item,
  })
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'KaushanScript',
            fontSize: 20.0,
          ),
        ),
        leading: Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 30.0,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black26,
          size: 30.0,
        ),
        onTap: () {
          print("tap");
          Navigator.push(context,
              MaterialPageRoute(builder: (_) {
                return Backdrop(
                  item: this.item,
                );
              })
          );
        },
      ),
    );
  }

}