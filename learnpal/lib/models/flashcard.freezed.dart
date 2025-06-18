// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Flashcard _$FlashcardFromJson(Map<String, dynamic> json) {
  return _Flashcard.fromJson(json);
}

/// @nodoc
mixin _$Flashcard {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get front => throw _privateConstructorUsedError;
  @HiveField(2)
  String get back => throw _privateConstructorUsedError;
  @HiveField(3)
  String get category => throw _privateConstructorUsedError;
  @HiveField(4)
  int get difficulty => throw _privateConstructorUsedError;
  @HiveField(5)
  int get timesReviewed => throw _privateConstructorUsedError;
  @HiveField(6)
  int get correctAnswers => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get lastReviewed => throw _privateConstructorUsedError;
  @HiveField(9)
  List<String> get tags => throw _privateConstructorUsedError;
  @HiveField(10)
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this Flashcard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashcardCopyWith<Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardCopyWith<$Res> {
  factory $FlashcardCopyWith(Flashcard value, $Res Function(Flashcard) then) =
      _$FlashcardCopyWithImpl<$Res, Flashcard>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String front,
      @HiveField(2) String back,
      @HiveField(3) String category,
      @HiveField(4) int difficulty,
      @HiveField(5) int timesReviewed,
      @HiveField(6) int correctAnswers,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime lastReviewed,
      @HiveField(9) List<String> tags,
      @HiveField(10) bool isFavorite});
}

/// @nodoc
class _$FlashcardCopyWithImpl<$Res, $Val extends Flashcard>
    implements $FlashcardCopyWith<$Res> {
  _$FlashcardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? front = null,
    Object? back = null,
    Object? category = null,
    Object? difficulty = null,
    Object? timesReviewed = null,
    Object? correctAnswers = null,
    Object? createdAt = null,
    Object? lastReviewed = null,
    Object? tags = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      timesReviewed: null == timesReviewed
          ? _value.timesReviewed
          : timesReviewed // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastReviewed: null == lastReviewed
          ? _value.lastReviewed
          : lastReviewed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardImplCopyWith<$Res>
    implements $FlashcardCopyWith<$Res> {
  factory _$$FlashcardImplCopyWith(
          _$FlashcardImpl value, $Res Function(_$FlashcardImpl) then) =
      __$$FlashcardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String front,
      @HiveField(2) String back,
      @HiveField(3) String category,
      @HiveField(4) int difficulty,
      @HiveField(5) int timesReviewed,
      @HiveField(6) int correctAnswers,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime lastReviewed,
      @HiveField(9) List<String> tags,
      @HiveField(10) bool isFavorite});
}

/// @nodoc
class __$$FlashcardImplCopyWithImpl<$Res>
    extends _$FlashcardCopyWithImpl<$Res, _$FlashcardImpl>
    implements _$$FlashcardImplCopyWith<$Res> {
  __$$FlashcardImplCopyWithImpl(
      _$FlashcardImpl _value, $Res Function(_$FlashcardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? front = null,
    Object? back = null,
    Object? category = null,
    Object? difficulty = null,
    Object? timesReviewed = null,
    Object? correctAnswers = null,
    Object? createdAt = null,
    Object? lastReviewed = null,
    Object? tags = null,
    Object? isFavorite = null,
  }) {
    return _then(_$FlashcardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      timesReviewed: null == timesReviewed
          ? _value.timesReviewed
          : timesReviewed // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastReviewed: null == lastReviewed
          ? _value.lastReviewed
          : lastReviewed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashcardImpl implements _Flashcard {
  const _$FlashcardImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.front,
      @HiveField(2) required this.back,
      @HiveField(3) required this.category,
      @HiveField(4) this.difficulty = 0,
      @HiveField(5) this.timesReviewed = 0,
      @HiveField(6) this.correctAnswers = 0,
      @HiveField(7) required this.createdAt,
      @HiveField(8) required this.lastReviewed,
      @HiveField(9) final List<String> tags = const [],
      @HiveField(10) this.isFavorite = false})
      : _tags = tags;

  factory _$FlashcardImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashcardImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String front;
  @override
  @HiveField(2)
  final String back;
  @override
  @HiveField(3)
  final String category;
  @override
  @JsonKey()
  @HiveField(4)
  final int difficulty;
  @override
  @JsonKey()
  @HiveField(5)
  final int timesReviewed;
  @override
  @JsonKey()
  @HiveField(6)
  final int correctAnswers;
  @override
  @HiveField(7)
  final DateTime createdAt;
  @override
  @HiveField(8)
  final DateTime lastReviewed;
  final List<String> _tags;
  @override
  @JsonKey()
  @HiveField(9)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  @HiveField(10)
  final bool isFavorite;

  @override
  String toString() {
    return 'Flashcard(id: $id, front: $front, back: $back, category: $category, difficulty: $difficulty, timesReviewed: $timesReviewed, correctAnswers: $correctAnswers, createdAt: $createdAt, lastReviewed: $lastReviewed, tags: $tags, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.timesReviewed, timesReviewed) ||
                other.timesReviewed == timesReviewed) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastReviewed, lastReviewed) ||
                other.lastReviewed == lastReviewed) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      front,
      back,
      category,
      difficulty,
      timesReviewed,
      correctAnswers,
      createdAt,
      lastReviewed,
      const DeepCollectionEquality().hash(_tags),
      isFavorite);

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardImplCopyWith<_$FlashcardImpl> get copyWith =>
      __$$FlashcardImplCopyWithImpl<_$FlashcardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardImplToJson(
      this,
    );
  }
}

abstract class _Flashcard implements Flashcard {
  const factory _Flashcard(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String front,
      @HiveField(2) required final String back,
      @HiveField(3) required final String category,
      @HiveField(4) final int difficulty,
      @HiveField(5) final int timesReviewed,
      @HiveField(6) final int correctAnswers,
      @HiveField(7) required final DateTime createdAt,
      @HiveField(8) required final DateTime lastReviewed,
      @HiveField(9) final List<String> tags,
      @HiveField(10) final bool isFavorite}) = _$FlashcardImpl;

  factory _Flashcard.fromJson(Map<String, dynamic> json) =
      _$FlashcardImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get front;
  @override
  @HiveField(2)
  String get back;
  @override
  @HiveField(3)
  String get category;
  @override
  @HiveField(4)
  int get difficulty;
  @override
  @HiveField(5)
  int get timesReviewed;
  @override
  @HiveField(6)
  int get correctAnswers;
  @override
  @HiveField(7)
  DateTime get createdAt;
  @override
  @HiveField(8)
  DateTime get lastReviewed;
  @override
  @HiveField(9)
  List<String> get tags;
  @override
  @HiveField(10)
  bool get isFavorite;

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashcardImplCopyWith<_$FlashcardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlashcardSet _$FlashcardSetFromJson(Map<String, dynamic> json) {
  return _FlashcardSet.fromJson(json);
}

/// @nodoc
mixin _$FlashcardSet {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  List<String> get flashcardIds => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(5)
  String get color => throw _privateConstructorUsedError;
  @HiveField(6)
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this FlashcardSet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashcardSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashcardSetCopyWith<FlashcardSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardSetCopyWith<$Res> {
  factory $FlashcardSetCopyWith(
          FlashcardSet value, $Res Function(FlashcardSet) then) =
      _$FlashcardSetCopyWithImpl<$Res, FlashcardSet>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) List<String> flashcardIds,
      @HiveField(4) DateTime createdAt,
      @HiveField(5) String color,
      @HiveField(6) String icon});
}

/// @nodoc
class _$FlashcardSetCopyWithImpl<$Res, $Val extends FlashcardSet>
    implements $FlashcardSetCopyWith<$Res> {
  _$FlashcardSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashcardSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? flashcardIds = null,
    Object? createdAt = null,
    Object? color = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardIds: null == flashcardIds
          ? _value.flashcardIds
          : flashcardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardSetImplCopyWith<$Res>
    implements $FlashcardSetCopyWith<$Res> {
  factory _$$FlashcardSetImplCopyWith(
          _$FlashcardSetImpl value, $Res Function(_$FlashcardSetImpl) then) =
      __$$FlashcardSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) List<String> flashcardIds,
      @HiveField(4) DateTime createdAt,
      @HiveField(5) String color,
      @HiveField(6) String icon});
}

/// @nodoc
class __$$FlashcardSetImplCopyWithImpl<$Res>
    extends _$FlashcardSetCopyWithImpl<$Res, _$FlashcardSetImpl>
    implements _$$FlashcardSetImplCopyWith<$Res> {
  __$$FlashcardSetImplCopyWithImpl(
      _$FlashcardSetImpl _value, $Res Function(_$FlashcardSetImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlashcardSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? flashcardIds = null,
    Object? createdAt = null,
    Object? color = null,
    Object? icon = null,
  }) {
    return _then(_$FlashcardSetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardIds: null == flashcardIds
          ? _value._flashcardIds
          : flashcardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashcardSetImpl implements _FlashcardSet {
  const _$FlashcardSetImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) required final List<String> flashcardIds,
      @HiveField(4) required this.createdAt,
      @HiveField(5) this.color = '',
      @HiveField(6) this.icon = ''})
      : _flashcardIds = flashcardIds;

  factory _$FlashcardSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashcardSetImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String description;
  final List<String> _flashcardIds;
  @override
  @HiveField(3)
  List<String> get flashcardIds {
    if (_flashcardIds is EqualUnmodifiableListView) return _flashcardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flashcardIds);
  }

  @override
  @HiveField(4)
  final DateTime createdAt;
  @override
  @JsonKey()
  @HiveField(5)
  final String color;
  @override
  @JsonKey()
  @HiveField(6)
  final String icon;

  @override
  String toString() {
    return 'FlashcardSet(id: $id, name: $name, description: $description, flashcardIds: $flashcardIds, createdAt: $createdAt, color: $color, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardSetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._flashcardIds, _flashcardIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_flashcardIds),
      createdAt,
      color,
      icon);

  /// Create a copy of FlashcardSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardSetImplCopyWith<_$FlashcardSetImpl> get copyWith =>
      __$$FlashcardSetImplCopyWithImpl<_$FlashcardSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardSetImplToJson(
      this,
    );
  }
}

abstract class _FlashcardSet implements FlashcardSet {
  const factory _FlashcardSet(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String description,
      @HiveField(3) required final List<String> flashcardIds,
      @HiveField(4) required final DateTime createdAt,
      @HiveField(5) final String color,
      @HiveField(6) final String icon}) = _$FlashcardSetImpl;

  factory _FlashcardSet.fromJson(Map<String, dynamic> json) =
      _$FlashcardSetImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  List<String> get flashcardIds;
  @override
  @HiveField(4)
  DateTime get createdAt;
  @override
  @HiveField(5)
  String get color;
  @override
  @HiveField(6)
  String get icon;

  /// Create a copy of FlashcardSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashcardSetImplCopyWith<_$FlashcardSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
