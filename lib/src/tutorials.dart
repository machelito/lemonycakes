part of app;

class TutorialsScreen extends StatelessWidget {

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
                  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                  child: Text(
                    allTranslations.text('tutorials'),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(14, (index) {
                    return Text(
                      'Item $index',
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
