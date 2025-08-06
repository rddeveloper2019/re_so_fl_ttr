import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_so_fl_ttr/auth/application/auth_notifier.dart';
import 'package:re_so_fl_ttr/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:re_so_fl_ttr/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:re_so_fl_ttr/auth/infrastructure/github_authenticator.dart';

final flutterSecureStorage = Provider((ref) => FlutterSecureStorage());

final credentialsStorageProvider = Provider<CredentialsStorage>(
  (ref) => SecureCredentialsStorage(storage: ref.watch(flutterSecureStorage)),
);

final dioProvider = Provider((ref) => Dio());

final githubAuthenticatorProvider = Provider(
  (ref) => GithubAuthenticator(
    credentialsStorage: ref.watch(credentialsStorageProvider),
    dio: ref.watch(dioProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(githubAuthenticatorProvider)),
);
