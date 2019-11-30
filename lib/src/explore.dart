part of app;

class ExploreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/marca.png',
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),)
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    child: Card(
                      elevation: 3.0,
                      color: galleryCard,
                      child: InkWell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                          child: Text(
                            allTranslations.text('gallery'),
                            style: cardTextStyle,
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
                            child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.5, 0.0),
                              child: Card(
                                elevation: 3.0,
                                color: recipesCard,
                                child: InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                                    child: Text(
                                      allTranslations.text('recipes'),
                                      style: cardTextStyle,
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
                          ),
                          Expanded(
                            child: Padding(
                            padding: EdgeInsets.fromLTRB(2.5, 0.0, 0.0, 0.0),
                              child: Card(
                                elevation: 3.0,
                                color: tutorialsCard,
                                child: InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                                    child: Text(
                                      allTranslations.text('tutorials'),
                                      style: cardTextStyle,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}


class TrendingItem extends StatelessWidget {

  final Item item;
  final bool favorite;

  const TrendingItem({
    Key key,
    @required this.item,
    @required this.favorite,
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
                  favorite: this.favorite,
                );
              })
            );
          },
        ),
      ),
    );
  }

}
