part of app;

class RecipesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenPadding),
        //decoration: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, titlePaddingTop, 0.0, 0.0),
                  child: Text(
                    allTranslations.text('recipes'),
                    style: titleTextStyle,
                  ),
                ),
              ],
            ),
            Flexible(
              child: StreamBuilder(
                stream: Firestore.instance.collection("recipes").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return Text("Loading...");
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Recipe(
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

class Recipe extends StatelessWidget {

  final Item item;

  const Recipe({
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
            fontFamily: 'KaushanScript',
            color: textColor,
            fontSize: 20.0,
          ),
        ),
        subtitle: Text(item.subtitle),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: textColor,
          size: 30.0,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen(
              item: item,
              favorite: false,
            );
          }));
        },
      ),
    );
  }

}