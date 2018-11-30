library app;

import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

part 'backdrop.dart';
part 'carousel.dart';
part 'detail.dart';
part 'explore.dart';
part 'favorites.dart';
part 'item.dart';
part 'login.dart';
part 'settings.dart';
part 'translations.dart';
part 'tutorials.dart';

class LemonyCakesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: allTranslations.supportedLocales(),
      title: 'Lemony Cakes',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: const Color(0xff716999),
        canvasColor: const Color(0xfffafafa),
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}

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
              child: FavoritesScreen(),
            ),
          ),
          Offstage(
            offstage: _currentTabIndex != 2,
            child: TickerMode(
              enabled: _currentTabIndex == 2,
              child: SettingsScreen(parent: this,),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: onTabTapped,
        fixedColor: const Color(0xff716999),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text(allTranslations.text('explore')),
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
