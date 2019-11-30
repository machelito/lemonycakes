part of app;

class GalleryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //decoration: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0.0),
                    child: Text(
                      allTranslations.text('gallery'),
                      style: titleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Carousel(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }

}