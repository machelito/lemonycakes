part of app;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  void onTabTapped(int index) {
    setState((){
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _currentTabIndex != 0,
            child: TickerMode(
              enabled: _currentTabIndex == 0,
              child: ExploreScreen(),
            ),
          ),
          Offstage(
            offstage: _currentTabIndex != 1,
            child: TickerMode(
              enabled: _currentTabIndex == 1,
              child: TrendingScreen(),
            ),
          ),
          Offstage(
            offstage: _currentTabIndex != 2,
            child: TickerMode(
              enabled: _currentTabIndex == 2,
              child: FavoritesScreen(),
            ),
          ),
          Offstage(
            offstage: _currentTabIndex != 3,
            child: TickerMode(
              enabled: _currentTabIndex == 3,
              child: SettingsScreen(parent: this,),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTabIndex,
        onTap: onTabTapped,
        fixedColor: Color(0xffb5a628),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(allTranslations.text('explore')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            title: Text(allTranslations.text('trending')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(allTranslations.text('favorites')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(allTranslations.text('settings')),
          ),
        ],
      ),
    );
  }

}