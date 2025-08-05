import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:re_so_fl_ttr/auth/infrastructure/credentials_storage/credentials_storage.dart';

class GithubAuthenticator {
  final CredentialsStorage _credentialsStorage;

  GithubAuthenticator({required CredentialsStorage credentialsStorage})
    : _credentialsStorage = credentialsStorage;

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();

      if (storedCredentials != null &&
          storedCredentials.canRefresh &&
          storedCredentials.isExpired) {
        //TODO: refresh
      }

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);
}
