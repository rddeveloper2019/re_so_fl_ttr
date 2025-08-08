// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GithubRepo {

 User get owner; String get name; String get description; int get stargazersCount;
/// Create a copy of GithubRepo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubRepoCopyWith<GithubRepo> get copyWith => _$GithubRepoCopyWithImpl<GithubRepo>(this as GithubRepo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubRepo&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount));
}


@override
int get hashCode => Object.hash(runtimeType,owner,name,description,stargazersCount);

@override
String toString() {
  return 'GithubRepo(owner: $owner, name: $name, description: $description, stargazersCount: $stargazersCount)';
}


}

/// @nodoc
abstract mixin class $GithubRepoCopyWith<$Res>  {
  factory $GithubRepoCopyWith(GithubRepo value, $Res Function(GithubRepo) _then) = _$GithubRepoCopyWithImpl;
@useResult
$Res call({
 User owner, String name, String description, int stargazersCount
});


$UserCopyWith<$Res> get owner;

}
/// @nodoc
class _$GithubRepoCopyWithImpl<$Res>
    implements $GithubRepoCopyWith<$Res> {
  _$GithubRepoCopyWithImpl(this._self, this._then);

  final GithubRepo _self;
  final $Res Function(GithubRepo) _then;

/// Create a copy of GithubRepo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? owner = null,Object? name = null,Object? description = null,Object? stargazersCount = null,}) {
  return _then(_self.copyWith(
owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as User,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of GithubRepo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get owner {
  
  return $UserCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [GithubRepo].
extension GithubRepoPatterns on GithubRepo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GithubRepo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GithubRepo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GithubRepo value)  $default,){
final _that = this;
switch (_that) {
case _GithubRepo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GithubRepo value)?  $default,){
final _that = this;
switch (_that) {
case _GithubRepo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User owner,  String name,  String description,  int stargazersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GithubRepo() when $default != null:
return $default(_that.owner,_that.name,_that.description,_that.stargazersCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User owner,  String name,  String description,  int stargazersCount)  $default,) {final _that = this;
switch (_that) {
case _GithubRepo():
return $default(_that.owner,_that.name,_that.description,_that.stargazersCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User owner,  String name,  String description,  int stargazersCount)?  $default,) {final _that = this;
switch (_that) {
case _GithubRepo() when $default != null:
return $default(_that.owner,_that.name,_that.description,_that.stargazersCount);case _:
  return null;

}
}

}

/// @nodoc


class _GithubRepo extends GithubRepo {
  const _GithubRepo({required this.owner, required this.name, required this.description, required this.stargazersCount}): super._();
  

@override final  User owner;
@override final  String name;
@override final  String description;
@override final  int stargazersCount;

/// Create a copy of GithubRepo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GithubRepoCopyWith<_GithubRepo> get copyWith => __$GithubRepoCopyWithImpl<_GithubRepo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GithubRepo&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount));
}


@override
int get hashCode => Object.hash(runtimeType,owner,name,description,stargazersCount);

@override
String toString() {
  return 'GithubRepo(owner: $owner, name: $name, description: $description, stargazersCount: $stargazersCount)';
}


}

/// @nodoc
abstract mixin class _$GithubRepoCopyWith<$Res> implements $GithubRepoCopyWith<$Res> {
  factory _$GithubRepoCopyWith(_GithubRepo value, $Res Function(_GithubRepo) _then) = __$GithubRepoCopyWithImpl;
@override @useResult
$Res call({
 User owner, String name, String description, int stargazersCount
});


@override $UserCopyWith<$Res> get owner;

}
/// @nodoc
class __$GithubRepoCopyWithImpl<$Res>
    implements _$GithubRepoCopyWith<$Res> {
  __$GithubRepoCopyWithImpl(this._self, this._then);

  final _GithubRepo _self;
  final $Res Function(_GithubRepo) _then;

/// Create a copy of GithubRepo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? owner = null,Object? name = null,Object? description = null,Object? stargazersCount = null,}) {
  return _then(_GithubRepo(
owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as User,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of GithubRepo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get owner {
  
  return $UserCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
