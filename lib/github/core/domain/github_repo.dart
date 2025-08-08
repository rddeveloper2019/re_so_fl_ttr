import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:re_so_fl_ttr/github/core/domain/user.dart';

part 'github_repo.freezed.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const GithubRepo._();
  const factory GithubRepo({
    required User owner,
    required String name,
    required String description,
    required int stargazersCount,
  }) = _GithubRepo;

  String get fullName => '${owner.name}/$name';

  @override
  String get description => description;

  @override
  String get name => name;

  @override
  User get owner => owner;

  @override
  int get stargazersCount => stargazersCount;
}
