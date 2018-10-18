part of app;

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container (
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration (
              color: const Color(0xff716999),
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: new AssetImage(
                  'assets/images/rainbowcake.jpg',
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/marca.png'),
                ),
                Column(
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0xFF0175c2),
                      onPressed: () {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Pendiente de implementar')));
                      },
                      child: Text(
                        'LOGIN CON FACEBOOK',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return HomeScreen();
                        }));
                      },
                      child: Text('ACCEDER COMO INVITADO'),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }

}