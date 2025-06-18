import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'flashcard.freezed.dart';
part 'flashcard.g.dart';

@freezed
@HiveType(typeId: 0)
class Flashcard with _$Flashcard {
  const factory Flashcard({
    @HiveField(0) required String id,
    @HiveField(1) required String front,
    @HiveField(2) required String back,
    @HiveField(3) required String category,
    @HiveField(4) @Default(0) int difficulty,
    @HiveField(5) @Default(0) int timesReviewed,
    @HiveField(6) @Default(0) int correctAnswers,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) required DateTime lastReviewed,
    @HiveField(9) @Default([]) List<String> tags,
    @HiveField(10) @Default(false) bool isFavorite,
  }) = _Flashcard;

  factory Flashcard.fromJson(Map<String, dynamic> json) =>
      _$FlashcardFromJson(json);
}

@freezed
@HiveType(typeId: 1)
class FlashcardSet with _$FlashcardSet {
  const factory FlashcardSet({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required List<String> flashcardIds,
    @HiveField(4) required DateTime createdAt,
    @HiveField(5) @Default('') String color,
    @HiveField(6) @Default('') String icon,
  }) = _FlashcardSet;

  factory FlashcardSet.fromJson(Map<String, dynamic> json) =>
      _$FlashcardSetFromJson(json);
}
