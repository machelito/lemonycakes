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
      backgroundColor: const Color(0xff7c94b6),
      appBar: AppBar(
        title: Text("Mis favoritos"),
      ),
      body: Container(
        child: Center(
          child: ListView(
              children: <Widget>[
                ListTile(
                  //leading: Image(
                  //  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/lemony-cakes.appspot.com/o/unicornio.jpg?alt=media&token=e85f4376-834d-437a-870a-a301cf3bb505'),
                  //),
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
                  //leading: Image(
                  //  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/lemony-cakes.appspot.com/o/unicornio.jpg?alt=media&token=e85f4376-834d-437a-870a-a301cf3bb505'),
                  //),
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
      ),
    );
  }
}