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
import 'package:firebase_auth/firebase_auth.dart';

part 'backdrop.dart';
part 'carousel.dart';
part 'detail.dart';
part 'explore.dart';
part 'favorites.dart';
part 'gallery.dart';
part 'home.dart';
part 'item.dart';
part 'login.dart';
part 'recipes.dart';
part 'settings.dart';
part 'translations.dart';
part 'tutorials.dart';

FirebaseUser user;

class LemonyCakesApp extends StatelessWidget {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnonymously() async{
    user = await firebaseAuth.signInAnonymously();
    print("Signed in as ${user.uid}");
    return user;
  }

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
      title: allTranslations.text('app_title'),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: const Color(0xff716999),
        canvasColor: const Color(0xfffafafa),
        fontFamily: 'Roboto',
      ),
      home: _handleLogin(),
    );
  }

  Widget _handleLogin() {
    return new StreamBuilder<FirebaseUser>(
        stream: firebaseAuth.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            signInAnonymously();
            return Scaffold(
              backgroundColor: const Color(0xff716999),
              body: Center(
                child: Text(
                  allTranslations.text('loading'),
                  style: TextStyle(
                    fontFamily: 'KaushanScript',
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                ),
              ),
            );
          } else {
            user = snapshot.data;
            return HomeScreen();
          }
        }
    );
  }

}

const double screenPadding = 15.0;
const double titlePaddingTop = 35.0;
const double titlePaddingLeft = 0.0;
const double titlePaddingRight = 0.0;
const double iconSize = 36.0;

const BoxDecoration background = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      "assets/images/marca4.png",
    ),
    fit: BoxFit.contain,
  ),
);