import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui/l10n/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum ProvidersTypes { email, google, facebook, twitter, guest, phone }

final GoogleSignIn googleSignIn = new GoogleSignIn();
final FacebookLogin facebookLogin = new FacebookLogin();

ProvidersTypes stringToProvidersType(String value) {
  if (value.toLowerCase().contains('facebook')) return ProvidersTypes.facebook;
  if (value.toLowerCase().contains('google')) return ProvidersTypes.google;
  if (value.toLowerCase().contains('password')) return ProvidersTypes.email;
  if (value.toLowerCase().contains('twitter')) return ProvidersTypes.twitter;
  if (value.toLowerCase().contains('guest')) return ProvidersTypes.guest;
//TODO  if (value.toLowerCase().contains('phone')) return ProvidersTypes.phone;
  return null;
}

// Description button
class ButtonDescription extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color color;
  final String logo;
  final IconData icon;
  final String name;
  final VoidCallback onSelected;

  const ButtonDescription(
      {@required this.label,
      @required this.name,
      this.logo,
      this.icon,
      this.onSelected,
      this.labelColor = Colors.grey,
      this.color = Colors.white});

  ButtonDescription copyWith({
    String label,
    Color labelColor,
    Color color,
    String logo,
    IconData icon,
    String name,
    VoidCallback onSelected,
  }) {
    return new ButtonDescription(
        label: label ?? this.label,
        labelColor: labelColor ?? this.labelColor,
        color: color ?? this.color,
        logo: logo ?? this.logo,
        icon: icon ?? this.icon,
        name: name ?? this.name,
        onSelected: onSelected ?? this.onSelected);
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback _onSelected = onSelected ?? () => {};
    return new RaisedButton(
        color: color,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
              child: icon != null ? Icon(icon, color: labelColor, size: 30 ) : Image.asset('assets/$logo', package: 'firebase_ui'),
            ),
            new Expanded(
              child: new Text(
                label,
                style: new TextStyle(color: labelColor),
              ),
            ),
          ],
        ),
        onPressed: _onSelected);
  }
}

Map<ProvidersTypes, ButtonDescription> providersDefinitions(BuildContext context) => {
      ProvidersTypes.facebook: new ButtonDescription(
          color: const Color.fromRGBO(59, 87, 157, 1.0),
          logo: "fb-logo.png",
          label: FFULocalizations.of(context).signInFacebook,
          name: "Facebook",
          labelColor: Colors.white),
      ProvidersTypes.google: new ButtonDescription(
          color: Colors.white,
          logo: "go-logo.png",
          label: FFULocalizations.of(context).signInGoogle,
          name: "Google",
          labelColor: Colors.black54),
      ProvidersTypes.email: new ButtonDescription(
          color: const Color.fromRGBO(219, 68, 55, 1.0),
          logo: "email-logo.png",
          label: FFULocalizations.of(context).signInEmail,
          name: "Email",
          labelColor: Colors.white),
      ProvidersTypes.twitter: new ButtonDescription(
          color: const Color.fromRGBO(29, 161, 242, 1.0),
          logo: "twitter-logo.png",
          label: FFULocalizations.of(context).signInTwitter,
          name: "Twitter",
          labelColor: Colors.white),
      ProvidersTypes.guest: new ButtonDescription(
          color: const Color.fromRGBO(244, 180, 0, 1.0),
          icon: Icons.person,
          label: FFULocalizations.of(context).signInGuest,
          name: "guest",
          labelColor: Colors.white),
    };

Future<Null> showErrorDialog(BuildContext context, String message, {String title}) {
  return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) => new AlertDialog(
      title: title != null ? new Text(title) : null,
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text(message ?? FFULocalizations.of(context).errorOccurred),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Row(
            children: <Widget>[
              new Text(FFULocalizations.of(context).cancelButtonLabel),
            ],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

Future<void> signOutProviders() async {
  var currentUser = await FirebaseAuth.instance.currentUser();
  if (currentUser != null) {
    await signOut(currentUser.providerData);
  }

  return await FirebaseAuth.instance.signOut();
}

Future<dynamic> signOut(Iterable providers) async {
  return Future.forEach(providers, (p) async {
    switch (p.providerId) {
      case 'facebook.com':
        await facebookLogin.logOut();
        break;
      case 'google.com':
        await googleSignIn.signOut();
        break;
    }
  });
}
