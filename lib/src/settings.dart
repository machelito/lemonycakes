part of app;

class SettingsScreen extends StatefulWidget {

  final _HomeScreenState parent;

  const SettingsScreen({
      Key key,
      @required this.parent,
  })
    : assert(parent != null),
      super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  int _radioValue = 1;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void handleRadioValueChanged(int value) async {
    String selectedLanguage = allTranslations.getSupportedLanguages()[value];
    await allTranslations.setNewLanguage(selectedLanguage, true);
    setState(() {
      _radioValue = value;
      widget.parent.setState((){});
    });
  }

  @override
  void initState() {
    super.initState();
    allTranslations.getCurrentLanguageIndex().then((result) {
      setState(() {
        _radioValue = result;
      });
    });
  }

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
                  padding: EdgeInsets.fromLTRB(0.0, titlePaddingTop, 0.0, 20.0),
                  child: Text(
                    allTranslations.text('settings'),
                    style: titleTextStyle,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 3.0,
                    color: customPink,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'English',
                                style: TextStyle(fontSize: 20.0, color: cardTextColor, fontFamily: 'KaushanScript',),
                              ),
                              Radio(
                                value: 0,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Español',
                                style: TextStyle(fontSize: 20.0, color: cardTextColor, fontFamily: 'KaushanScript',),
                              ),
                              Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '中文',
                                style: TextStyle(fontSize: 20.0, color: cardTextColor, fontFamily: 'KaushanScript',),
                              ),
                              Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, titlePaddingTop, 0.0, 20.0),
                  child: Text(
                    "Contacto",
                    style: titleTextStyle,
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