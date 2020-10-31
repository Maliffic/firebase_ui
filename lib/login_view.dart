import 'package:apple_sign_in/apple_sign_in.dart' as Apple;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'email_view.dart';
import 'utils.dart';

class LoginView extends StatefulWidget {
  final List<ProvidersTypes> providers;
  final bool passwordCheck;
  final String twitterConsumerKey;
  final String twitterConsumerSecret;
  final double bottomPadding;
  final bool appleSignIn;

  LoginView(
      {Key key,
      @required this.providers,
      this.passwordCheck,
      this.twitterConsumerKey,
      this.twitterConsumerSecret,
      @required this.bottomPadding,
      this.appleSignIn})
      : super(key: key);

  @override
  _LoginViewState createState() => new _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Future<bool> _isAvailableFuture = Apple.AppleSignIn.isAvailable();

  Map<ProvidersTypes, dynamic> _buttons;

  _handleEmailSignIn() async {
    String value = await Navigator.of(context)
        .push(new MaterialPageRoute<String>(builder: (BuildContext context) {
      return new EmailView(widget.passwordCheck);
    }));

    if (value != null) {
      _followProvider(value);
    }
  }

  _handleGoogleSignIn() async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken != null) {
        try {
          AuthCredential credential = GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
          UserCredential authResult = await _auth.signInWithCredential(credential);
          User user = authResult.user;
          print(user);
        } catch (e) {
          showErrorDialog(context, e.details);
        }
      }
    }
  }

  _handleFacebookSignin() async {
    FacebookLoginResult result = await facebookLogin.logIn(['email']);
    if (result.accessToken != null) {
      try {
        AuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
        UserCredential authResult = await _auth.signInWithCredential(credential);
        User user = authResult.user;
        print(user);
      } catch (e) {
        showErrorDialog(context, e.details);
      }
    }
  }

  _handleTwitterSignin() async {
    var twitterLogin = new TwitterLogin(
      consumerKey: widget.twitterConsumerKey,
      consumerSecret: widget.twitterConsumerSecret,
    );

    final TwitterLoginResult result = await twitterLogin.authorize();

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        AuthCredential credential = TwitterAuthProvider.credential(accessToken:result.session.token,secret: result.session.secret);
        await _auth.signInWithCredential(credential);
        break;
      case TwitterLoginStatus.cancelledByUser:
        showErrorDialog(context, 'Login cancelled.');
        break;
      case TwitterLoginStatus.error:
        showErrorDialog(context, result.errorMessage);
        break;
    }
  }

  Future<User> _signInWithApple({List<Apple.Scope> scopes = const []}) async {
    // 1. perform the sign-in request
    final result = await Apple.AppleSignIn.performRequests(
        [Apple.AppleIdRequest(requestedScopes: scopes)]);
    // 2. check the result
    switch (result.status) {
      case Apple.AuthorizationStatus.authorized:
        final appleIdCredential = result.credential;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode),
        );
        final authResult = await _auth.signInWithCredential(credential);
        final firebaseUser = authResult.user;
        if (scopes.contains(Apple.Scope.fullName)) {
         var displayName =
              '${appleIdCredential.fullName.givenName} ${appleIdCredential.fullName.familyName}';
          await firebaseUser.updateProfile(displayName: displayName);
        }
        return firebaseUser;
      case Apple.AuthorizationStatus.error:
        print(result.error.toString());
        throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: result.error.toString(),
        );

      case Apple.AuthorizationStatus.cancelled:
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _buttons = {
      ProvidersTypes.apple: FutureBuilder<bool>(
          future: _isAvailableFuture,
          builder: (context, isAvailableSnapshot) {
            if (isAvailableSnapshot.hasData && isAvailableSnapshot.data) {
              return Apple.AppleSignInButton(
                style: Apple.ButtonStyle.white, // style as needed
                type: Apple.ButtonType.signIn, // style as needed
                onPressed: () =>
                    _signInWithApple(scopes: [Apple.Scope.email,Apple.Scope.fullName]),
              );
            } else {
              return Container();
            }
          }),
      ProvidersTypes.facebook:
          providersDefinitions(context)[ProvidersTypes.facebook]
              .copyWith(onSelected: _handleFacebookSignin),
      ProvidersTypes.google:
          providersDefinitions(context)[ProvidersTypes.google]
              .copyWith(onSelected: _handleGoogleSignIn),
      ProvidersTypes.twitter:
          providersDefinitions(context)[ProvidersTypes.twitter]
              .copyWith(onSelected: _handleTwitterSignin),
      ProvidersTypes.email: providersDefinitions(context)[ProvidersTypes.email]
          .copyWith(onSelected: _handleEmailSignIn),
    };

    return new Container(
        // padding: widget.padding,
        child: new Column(
      children: widget.providers.map((p) {
        return new Container(
            padding: EdgeInsets.only(bottom: widget.bottomPadding),
            child: _buttons[p] ?? new Container());
      }).toList(),
    ));
  }

  void _followProvider(String value) {
    ProvidersTypes provider = stringToProvidersType(value);
    if (provider == ProvidersTypes.facebook) {
      _handleFacebookSignin();
    } else if (provider == ProvidersTypes.google) {
      _handleGoogleSignIn();
    } else if (provider == ProvidersTypes.twitter) {
      _handleTwitterSignin();
    }
  }
}
