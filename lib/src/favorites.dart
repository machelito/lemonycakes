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

  void onTabTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) {
                return HomeScreen();
              }));
          break;
        case 2:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) {
                return SettingsScreen();
              }));
          break;
        default:
        // do nothing;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                  child: Text(
                    "Mis favoritos",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text("Favorito 1"),
              trailing: IconButton(
                icon: (_isFavorited
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border)),
                color: (_isFavorited
                    ? Colors.pinkAccent
                    : Colors.white),
                onPressed: _toggleFavorite,
              ),
            ),
            ListTile(
              title: Text("Favorito 2"),
              trailing: IconButton(
                icon: (_isFavorited
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border)),
                color: (_isFavorited
                    ? Colors.pinkAccent
                    : Colors.white),
                onPressed: _toggleFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}