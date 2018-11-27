part of app;

class ExploreScreen extends StatelessWidget {

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
                    allTranslations.text('explore'),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
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
                            return Scaffold(
                              body: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(15.0, 55.0, 15.0, 0.0),
                                          child: Text(
                                            allTranslations.text('gallery'),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 25.0),
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
                                          child: Carousel(
                                            category: 'cakes',
                                          ),
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
                            );
                          }));
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
                                        return Carousel(
                                          category: 'cakes',
                                        );
                                      }));
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
                                        return Carousel(
                                          category: 'cakes',
                                        );
                                      }));
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
                  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                  child: Text(
                    allTranslations.text('trending'),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 15.0),
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
