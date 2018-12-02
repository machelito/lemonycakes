part of app;

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnonymously() async{
    FirebaseUser user = await firebaseAuth.signInAnonymously();
    print("Signed in as ${user.uid}");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container (
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration (
              color: const Color(0xff716999),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage(
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
                    ButtonTheme(
                      height: 40.0,
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: RaisedButton(
                        onPressed:  () {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Pendiente de implementar')));
                        },
                        color: Color(0xFF4267B2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image(
                              image: AssetImage(
                                "assets/images/facebook_white.png",
                              ),
                              height: 24.0,
                              width: 24.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0, right: 10.0),
                              child: Text(
                                "Continuar con Facebook",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        signInAnonymously();
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