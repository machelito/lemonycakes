part of app;

class RecipesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, titlePaddingTop, 0.0, 0.0),
                  child: Text(
                    allTranslations.text('recipes'),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 14,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Receta $index"),
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