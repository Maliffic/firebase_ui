import 'dart:ui' show Locale;

class TranslationBundle {
  const TranslationBundle(this.parent);
  final TranslationBundle parent;

  String get welcome => parent?.welcome;

  String get signUpTitle => parent?.signUpTitle;

  String get emailLabel => parent?.emailLabel;

  String get nextButtonLabel => parent?.nextButtonLabel;

  String get cancelButtonLabel => parent?.cancelButtonLabel;

  String get passwordLabel => parent?.passwordLabel;

  String get passwordCheckLabel => parent?.passwordCheckLabel;

  String get passwordCheckError => parent?.passwordCheckError;

  String get troubleSigningInLabel => parent?.troubleSigningInLabel;

  String get signInLabel => parent?.signInLabel;

  String get signInTitle => parent?.signInTitle;

  String get passwordInvalidMessage => parent?.passwordInvalidMessage;

  String get recoverPasswordTitle => parent?.recoverPasswordTitle;

  String get recoverHelpLabel => parent?.recoverHelpLabel;

  String get sendButtonLabel => parent?.sendButtonLabel;

  String get nameLabel => parent?.nameLabel;

  String get saveLabel => parent?.saveLabel;

  String get passwordLengthMessage => parent?.passwordLengthMessage;

  String get signInFacebook => parent?.signInFacebook;
  String get signInGoogle => parent?.signInGoogle;
  String get signInEmail => parent?.signInEmail;
  String get signInTwitter => parent?.signInTwitter;

  String get errorOccurred => parent?.errorOccurred;

  allReadyEmailMessage(String email, String providerName) =>
      parent?.allReadyEmailMessage(email, providerName);

  recoverDialog(String email) => parent?.recoverDialog(email);
}

// ignore: camel_case_types
class _Bundle_fr extends TranslationBundle {
  const _Bundle_fr() : super(null);

  @override
  String get welcome => r'Bienvenue';
  @override
  String get signUpTitle => 'Enregistrer un nouvel utilisateur';
  @override
  String get emailLabel => r'Adresse mail';
  @override
  String get passwordLabel => r'Mot de passe';

  @override
  String get passwordCheckLabel => r'Confirmez le mot de passe';

  @override
  String get passwordCheckError => r'Les deux mots de passe sont différents.';

  @override
  String get nextButtonLabel => r'SUIVANT';
  @override
  String get cancelButtonLabel => r'ANNULER';
  @override
  String get signInLabel => r'CONNEXION';

  @override
  String get saveLabel => r'ENREGISTRER';

  @override
  String get signInTitle => r'Connexion';

  @override
  String get troubleSigningInLabel => 'Difficultés à se connecter ?';

  @override
  String get passwordInvalidMessage =>
      'Le mot de passe est invalide ou l\'utilisateur n\'a pas de mot de passe.';

  @override
  String get recoverPasswordTitle => r'Récupérer mot de passe';

  @override
  String get recoverHelpLabel =>
      r'Obtenez des instructions envoyées à cet e-mail ' +
      'pour expliquer comment réinitialiser votre mot de passe';

  @override
  String get sendButtonLabel => r'ENVOYER';

  @override
  String get nameLabel => r'Nom et prénom';

  @override
  String get errorOccurred => r'Une erreur est survenue';

  @override
  allReadyEmailMessage(String email, String providerName) {
    return '''Vous avez déjà utilisé $email.
Connectez-vous avec $providerName pour continuer.''';
  }

  @override
  recoverDialog(String email) {
    return 'Suivez les instructions envoyées à $email ' +
        'pour retrouver votre mot de passe';
  }

  String get passwordLengthMessage =>
      r'Le mot de passe doit comporter 6 caractères ou plus';

  @override
  String get signInFacebook => r'Connexion avec Facebook';

  @override
  String get signInGoogle => r'Connexion avec Google';

  @override
  String get signInEmail => r'Connexion avec email';

  @override
  String get signInTwitter => r'Connexion avec Twitter';
}

// ignore: camel_case_types
class _Bundle_en extends TranslationBundle {
  const _Bundle_en() : super(null);

  @override
  String get welcome => r'Welcome';
  @override
  String get signUpTitle => 'Register new user';
  @override
  String get emailLabel => r'Email';
  @override
  String get passwordLabel => r'Password';

  @override
  String get passwordCheckLabel => r'Confirm the password';

  @override
  String get passwordCheckError => r'The two passwords are different';

  @override
  String get nextButtonLabel => r'NEXT';
  @override
  String get cancelButtonLabel => r'CANCEL';
  @override
  String get signInLabel => r'SIGN IN';
  @override
  String get signInTitle => r'Sign in';

  @override
  String get saveLabel => r'SAVE';

  @override
  String get troubleSigningInLabel => 'Trouble signing in ?';

  @override
  String get passwordInvalidMessage =>
      'The password is invalid or the user does not have password.';

  @override
  String get recoverPasswordTitle => r'Recover password';

  @override
  String get recoverHelpLabel =>
      r'Get instructions sent to this email ' +
      'that explain how to reset your password';

  @override
  String get sendButtonLabel => r'SEND';

  @override
  String get nameLabel => r'First & last name';

  @override
  String get errorOccurred => r'An error occurred';

  @override
  allReadyEmailMessage(String email, String providerName) {
    return '''You have already used $email.
Sign in with $providerName to continue.''';
  }

  @override
  recoverDialog(String email) {
    return 'Follow the instructions sent to $email to recover your password';
  }

  String get passwordLengthMessage =>
      r'The password must be 6 characters long or more';

  @override
  String get signInFacebook => r'Sign in with Facebook';

  @override
  String get signInGoogle => r'Sign in with Google';

  @override
  String get signInEmail => r'Sign in with email';

  @override
  String get signInTwitter => r'Sign in with Twitter';
}

// ignore: camel_case_types
class _Bundle_de extends TranslationBundle {
  const _Bundle_de() : super(null);

  @override
  String get welcome => r'Willkommen';
  @override
  String get signUpTitle => 'Neuen Benutzer registrieren';
  @override
  String get emailLabel => r'Email';
  @override
  String get passwordLabel => r'Passwort';

  @override
  String get passwordCheckLabel => r'Bestätigen Sie das Passwort';

  @override
  String get passwordCheckError => r'Die zwei Passwörter sind unterschiedlich';

  @override
  String get nextButtonLabel => r'WEITER';
  @override
  String get cancelButtonLabel => r'ABBRUCH';
  @override
  String get signInLabel => r'ANMELDEN';
  @override
  String get signInTitle => r'Anmelden';

  @override
  String get saveLabel => r'SPEICHERN';

  @override
  String get troubleSigningInLabel => 'Probleme beim Anmelden?';

  @override
  String get passwordInvalidMessage =>
      'Das Passwort ist ungültig oder der Bentutzer hat kein Passwort.';

  @override
  String get recoverPasswordTitle => r'Passwort wiederherstellen';

  @override
  String get recoverHelpLabel =>
      r'Erhalte Anweisungen zum Wiederherstellen des Passworts ' +
      'an diese Email';

  @override
  String get sendButtonLabel => r'SENDEN';

  @override
  String get nameLabel => r'Vor- & Nachname';

  @override
  String get errorOccurred => r'Ein Fehler ist aufgetreten';

  @override
  allReadyEmailMessage(String email, String providerName) {
    return '''$email wurde bereits genutzt.
Mit $providerName anmelden um fortzufarhen.''';
  }

  @override
  recoverDialog(String email) {
    return 'Befolge die Anweisungen, welche an $email gesendet wurden um das Passswort wiederherzustellen';
  }

  String get passwordLengthMessage =>
      r'Das Passwort muss 6 oder mehr Zeichen haben';

  @override
  String get signInFacebook => r'Mit Facebook anmelden';

  @override
  String get signInGoogle => r'Mit Google anmelden';

  @override
  String get signInEmail => r'Mit Email anmelden';

  @override
  String get signInTwitter => r'Mit Twitter anmelden';
}

// ignore: camel_case_types
class _Bundle_pt extends TranslationBundle {
  const _Bundle_pt() : super(null);

  @override
  String get welcome => r'Bem-Vindo';
  @override
  String get signUpTitle => 'Registrar novo usuário';
  @override
  String get emailLabel => r'E-mail';
  @override
  String get passwordLabel => r'Senha';

  @override
  String get passwordCheckLabel => r'Confirme a senha';

  @override
  String get passwordCheckError => r'As senhas são diferentes';

  @override
  String get nextButtonLabel => r'PRÓXIMA';
  @override
  String get cancelButtonLabel => r'CANCELAR';
  @override
  String get signInLabel => r'FAZER LOGIN';
  @override
  String get signInTitle => r'Fazer login';

  @override
  String get saveLabel => r'SALVAR';

  @override
  String get troubleSigningInLabel => 'Problemas ao fazer login ?';

  @override
  String get passwordInvalidMessage =>
      'A senha é inválida ou o usuário não possui uma senha.';

  @override
  String get recoverPasswordTitle => r'Recuperar a senha';

  @override
  String get recoverHelpLabel =>
      r'Siga as instruções enviadas para esse e-mail ' +
      'para descobrir como redefinir sua senha';

  @override
  String get sendButtonLabel => r'ENVIAR';

  @override
  String get nameLabel => r'Nome e sobrenome';

  @override
  String get errorOccurred => r'Ocorreu um erro';

  @override
  allReadyEmailMessage(String email, String providerName) {
    return '''Você já usou o e-mail $email.
Faça login com o $providerName para continuar.''';
  }

  @override
  recoverDialog(String email) {
    return 'Siga as instruções enviadas para $email para recuperar sua senha';
  }

  String get passwordLengthMessage =>
      r'A senha deve ter pelo menos 6 caracteres';

  @override
  String get signInFacebook => r'Login com o Facebook';

  @override
  String get signInGoogle => r'Login com o Google';

  @override
  String get signInEmail => r'Login com o e-mail';
}

// ignore: camel_case_types
class _Bundle_es extends TranslationBundle {
  const _Bundle_es() : super(null);

  @override
  String get welcome => r'Bienvenido';
  @override
  String get emailLabel => r'Email';
  @override
  String get passwordLabel => r'Contraseña';

  @override
  String get passwordCheckLabel => r'Confirma la contraseña';

  @override
  String get passwordCheckError => r'Las contraseñas no coinciden';

  @override
  String get nextButtonLabel => r'SIGUIENTE';
  @override
  String get cancelButtonLabel => r'CANCELAR';
  @override
  String get signInLabel => r'ENTRAR';
  @override
  String get signInTitle => r'Entrar';

  @override
  String get saveLabel => r'GUARDAR';

  @override
  String get troubleSigningInLabel => 'Problemas para entrar ?';

  @override
  String get passwordInvalidMessage =>
      'La contraseña es inválida o el usuario no tiene contraseña.';

  @override
  String get recoverPasswordTitle => r'Recuperar contraseña';

  @override
  String get recoverHelpLabel =>
      r'Sigue las instrucciones enviadas a este email ' +
      'para descubrir cómo reiniciar tu contraseña';

  @override
  String get sendButtonLabel => r'ENVIAR';

  @override
  String get nameLabel => r'Nombres y apellidos';

  @override
  String get errorOccurred => r'Occurió un error';

  @override
  allReadyEmailMessage(String email, String providerName) {
    return '''Ya has usado el email $email.
Entra con $providerName para continuar.''';
  }

  @override
  recoverDialog(String email) {
    return 'Siga las instrucciones enviadas a $email para recuperar tu contraseña';
  }

  String get passwordLengthMessage =>
      r'La contraseña debe tener 6 o más caracteres';

  @override
  String get signInFacebook => r'Entrar con Facebook';

  @override
  String get signInGoogle => r'Entrar con Google';

  @override
  String get signInEmail => r'Entrar con email';

  @override
  String get signInTwitter => r'Entrar con Twitter';
}

TranslationBundle translationBundleForLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'fr':
      return const _Bundle_fr();
    case 'en':
      return const _Bundle_en();
    case 'de':
      return const _Bundle_de();
    case 'pt':
      return const _Bundle_pt();
    case 'es':
      return const _Bundle_es();
  }
  return const TranslationBundle(null);
}
