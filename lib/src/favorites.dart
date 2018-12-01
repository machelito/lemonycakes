part of app;

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenPadding),
        decoration: background,
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                  child: Text(
                    allTranslations.text('favorites'),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            Favorite(),
            Favorite(),Favorite(),Favorite(),Favorite(),Favorite(),Favorite(),
          ],
        ),
      ),
    );
  }
}

class Favorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text(
          "Favorito",
          style: TextStyle(
            fontFamily: 'KaushanScript',
            fontSize: 20.0,
          ),
        ),

        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black26,
          size: 30.0,
        ),
        onTap: () {

        },
      ),
    );
  }

}