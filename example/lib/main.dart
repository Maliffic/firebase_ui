import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:firebase_ui/l10n/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FFULocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr', 'FR'),
        const Locale('en', 'US'),
        const Locale('de', 'DE'),
        const Locale('pt', 'BR'),
        const Locale('es', 'MX'),
      ],
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth _auth;
  User _currentUser;
  bool _error = false;
  bool _initialized = false;
  StreamSubscription<User> _listener;

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _auth = FirebaseAuth.instance;
        _initialized = true;
        _checkCurrentUser();
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void _checkCurrentUser() async {
    _currentUser = _auth.currentUser;
    _currentUser?.getIdToken(true);

    _listener = _auth.authStateChanges().listen((User user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Text('Loading');
    }
    if (_currentUser == null) {
      return new SignInScreen(
        title: "Demo",
        header: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Text("Demo"),
          ),
        ),
        showBar: true,
        // horizontalPadding: 8,
        bottomPadding: 5,
        avoidBottomInset: true,
        color: Color(0xFF363636),
        providers: [
          ProvidersTypes.google,
          ProvidersTypes.facebook,
          ProvidersTypes.twitter,
          ProvidersTypes.email,
          ProvidersTypes.apple
        ],
        twitterConsumerKey: "",
        twitterConsumerSecret: "", horizontalPadding: 12,
      );
    } else {
      return new HomeScreen(user: _currentUser);
    }
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({this.user});

  final FirebaseUser user;

  void _logout() {
    signOutProviders();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(
        title: new Text("Bienvenue"),
        elevation: 4.0,
      ),
      body: new Container(
          padding: const EdgeInsets.all(16.0),
          decoration: new BoxDecoration(color: Colors.amber),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Welcome,"),
                ],
              ),
              new SizedBox(
                height: 8.0,
              ),
              new Text(user.displayName ?? user.email),
              new SizedBox(
                height: 32.0,
              ),
              new RaisedButton(
                  child: new Text("DECONNEXION"), onPressed: _logout)
            ],
          )));
}
