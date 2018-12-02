part of app;

class ExploreScreen extends StatelessWidget {

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
                    allTranslations.text('explore'),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 3.0,
                    color: const Color(0xffff7282),
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                        child: Text(
                          allTranslations.text('gallery'),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'KaushanScript',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                            return GalleryScreen();
                          })
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Card(
                              elevation: 3.0,
                              color: const Color(0xff65dad0),
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                                  child: Text(
                                    allTranslations.text('recipes'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'KaushanScript',
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                      return RecipesScreen();
                                    })
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              elevation: 3.0,
                              color: const Color(0xfff3b163),
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                                  child: Text(
                                    allTranslations.text('tutorials'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'KaushanScript',
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                      return TutorialsScreen();
                                    })
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: Text(
                    allTranslations.text('trending'),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0),
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
                          title: snapshot.data.documents[last - index]['title'],
                          tag: snapshot.data.documents[last - index].documentID + '_thumbnail',
                        ),
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


class TrendingItem extends StatelessWidget {

  final Item item;

  const TrendingItem({
    Key key,
    @required this.item,
  })
    : assert(item != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        elevation: 3.0,
        child: InkWell(
          child: Hero(
            tag: this.item.tag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                this.item.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (_) {
                return Backdrop(
                  item: this.item,
                );
              })
            );
          },
        ),
      ),
    );
  }

}
