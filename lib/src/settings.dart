part of app;

class SettingsScreen extends StatefulWidget {

  @override
  _SettingsScreenState createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  int _radioValue = 1;

  void handleRadioValueChanged(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7c94b6),
      appBar: AppBar(
        title: Text("Configuración"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Idioma",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'English',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
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
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
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
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
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
    );
  }

}