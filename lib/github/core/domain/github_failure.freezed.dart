// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GithubFailure {

 int? get errorCode;
/// Create a copy of GithubFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubFailureCopyWith<GithubFailure> get copyWith => _$GithubFailureCopyWithImpl<GithubFailure>(this as GithubFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubFailure&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,errorCode);

@override
String toString() {
  return 'GithubFailure(errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $GithubFailureCopyWith<$Res>  {
  factory $GithubFailureCopyWith(GithubFailure value, $Res Function(GithubFailure) _then) = _$GithubFailureCopyWithImpl;
@useResult
$Res call({
 int? errorCode
});




}
/// @nodoc
class _$GithubFailureCopyWithImpl<$Res>
    implements $GithubFailureCopyWith<$Res> {
  _$GithubFailureCopyWithImpl(this._self, this._then);

  final GithubFailure _self;
  final $Res Function(GithubFailure) _then;

/// Create a copy of GithubFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GithubFailure].
extension GithubFailurePatterns on GithubFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Api value)?  api,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Api() when api != null:
return api(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Api value)  api,}){
final _that = this;
switch (_that) {
case _Api():
return api(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Api value)?  api,}){
final _that = this;
switch (_that) {
case _Api() when api != null:
return api(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? errorCode)?  api,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Api() when api != null:
return api(_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? errorCode)  api,}) {final _that = this;
switch (_that) {
case _Api():
return api(_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? errorCode)?  api,}) {final _that = this;
switch (_that) {
case _Api() when api != null:
return api(_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _Api extends GithubFailure {
  const _Api(this.errorCode): super._();
  

@override final  int? errorCode;

/// Create a copy of GithubFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiCopyWith<_Api> get copyWith => __$ApiCopyWithImpl<_Api>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Api&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,errorCode);

@override
String toString() {
  return 'GithubFailure.api(errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$ApiCopyWith<$Res> implements $GithubFailureCopyWith<$Res> {
  factory _$ApiCopyWith(_Api value, $Res Function(_Api) _then) = __$ApiCopyWithImpl;
@override @useResult
$Res call({
 int? errorCode
});




}
/// @nodoc
class __$ApiCopyWithImpl<$Res>
    implements _$ApiCopyWith<$Res> {
  __$ApiCopyWithImpl(this._self, this._then);

  final _Api _self;
  final $Res Function(_Api) _then;

/// Create a copy of GithubFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorCode = freezed,}) {
  return _then(_Api(
freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
