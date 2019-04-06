import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'l10n/localization.dart';
import 'trouble_signin.dart';
import 'utils.dart';

class PasswordView extends StatefulWidget {
  final String email;

  PasswordView(this.email, {Key key}) : super(key: key);

  @override
  _PasswordViewState createState() => new _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword;

  @override
  initState() {
    super.initState();
    _controllerEmail = new TextEditingController(text: widget.email);
    _controllerPassword = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _controllerEmail.text = widget.email;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(FFULocalizations.of(context).signInTitle),
        elevation: 4.0,
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: new InputDecoration(
                      labelText: FFULocalizations.of(context).emailLabel),
                ),
                //const SizedBox(height: 5.0),
                new TextField(
                  controller: _controllerPassword,
                  autofocus: true,
                  onSubmitted: _submit,
                  obscureText: true,
                  autocorrect: false,
                  decoration: new InputDecoration(
                      labelText: FFULocalizations.of(context).passwordLabel),
                ),
                new SizedBox(height: 16.0),
                new Container(
                    alignment: Alignment.centerLeft,
                    child: new InkWell(
                        child: new Text(
                          FFULocalizations.of(context).troubleSigningInLabel,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        onTap: _handleLostPassword)),
              ],
            ),
          );
        },
      ),
      persistentFooterButtons: <Widget>[
        new ButtonBar(
          alignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new FlatButton(
                onPressed: () => _connexion(context),
                child: new Row(
                  children: <Widget>[
                    new Text(FFULocalizations.of(context).signInLabel),
                  ],
                )),
          ],
        )
      ],
    );
  }

  _submit(String submitted) {
    _connexion(context);
  }

  _handleLostPassword() {
    Navigator.of(context)
        .push(new MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new TroubleSignIn(_controllerEmail.text);
    }));
  }

  _connexion(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      print(user);
    } catch (exception) {
      //TODO improve errors catching
      String msg = FFULocalizations.of(context).passwordInvalidMessage;
      showErrorDialog(context, msg);
    }

    if (user != null) {
      Navigator.of(context).pop(true);
    }
  }
}
