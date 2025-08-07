import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:re_so_fl_ttr/auth/domain/auth_failure.dart';
import 'package:re_so_fl_ttr/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:re_so_fl_ttr/core/infrastructure/dio_extensions.dart';
import 'package:re_so_fl_ttr/core/shared/encoders.dart';

class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}

class GithubAuthenticator {
  GithubAuthenticator({
    required CredentialsStorage credentialsStorage,
    required Dio dio,
  }) : _credentialsStorage = credentialsStorage,
       _dio = dio;

  final CredentialsStorage _credentialsStorage;
  final Dio _dio;

  // static const clientId = '';
  // static const clientSecret = '';
  static const clientId = 'Ov23liw6p2ooloVwl70I';
  static const clientSecret = '130e3332df3881fbcb4b76f3f9d60278cb0d213a';

  static const scopes = ['read:user', 'repo'];

  static final authorizationEndpoint = Uri.parse(
    'https://github.com/login/oauth/authorize',
  );

  static final tokenEndpoint = Uri.parse(
    'https://github.com/login/oauth/access_token',
  );

  static final revocationEndpoint = Uri.parse(
    'https://api.github.com/applications/$clientId/token',
  );

  static final redirectUrl = Uri.parse('http://localhost:3000/callback');
  // static final redirectUrl = Uri.parse(
  //   'https://github.com/rddeveloper2019/auth/github/callback',
  // );

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();

      if (storedCredentials != null &&
          storedCredentials.canRefresh &&
          storedCredentials.isExpired) {
        final failureOrCredentials = await refresh(storedCredentials);
        return failureOrCredentials.fold((l) => null, (r) => null);
      }

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: GithubOAuthHttpClient(),
    );
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParameters,
  ) async {
    try {
      final Client httpClient = await grant.handleAuthorizationResponse(
        queryParameters,
      );
      await _credentialsStorage.save(httpClient.credentials);
      print('saved');
      return right(unit);
    } on FormatException catch (e) {
      print('FormatException ${e.message}');
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      print('AuthorizationException ${e.error} ${e.description}');
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException catch (e) {
      print('PlatformException ${e.message}');
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    final usernameAndPassword = stringToBase64.encode(
      '$clientId:$clientSecret',
    );

    try {
      final credentials = await _credentialsStorage.read();
      await _dio.deleteUri(
        revocationEndpoint,
        data: {'access_token': credentials?.accessToken ?? ""},
        options: Options(
          headers: {'Authorization': 'basic $usernameAndPassword'},
        ),
      );
    } on DioException catch (e) {
      if (e.isNoConnectionException) {
        print('token is not revoked');
      } else {
        rethrow;
      }
    }

    try {
      await _credentialsStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
    Credentials credentials,
  ) async {
    try {
      final refreshCredentials = await credentials.refresh(
        identifier: clientId,
        secret: clientSecret,
        httpClient: GithubOAuthHttpClient(),
      );
      await _credentialsStorage.save(refreshCredentials);
      return right(refreshCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
