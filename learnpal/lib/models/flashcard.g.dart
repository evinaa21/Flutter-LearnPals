// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlashcardAdapter extends TypeAdapter<Flashcard> {
  @override
  final int typeId = 0;

  @override
  Flashcard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Flashcard(
      id: fields[0] as String,
      front: fields[1] as String,
      back: fields[2] as String,
      category: fields[3] as String,
      difficulty: fields[4] as int,
      timesReviewed: fields[5] as int,
      correctAnswers: fields[6] as int,
      createdAt: fields[7] as DateTime,
      lastReviewed: fields[8] as DateTime,
      tags: (fields[9] as List).cast<String>(),
      isFavorite: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Flashcard obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.front)
      ..writeByte(2)
      ..write(obj.back)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.difficulty)
      ..writeByte(5)
      ..write(obj.timesReviewed)
      ..writeByte(6)
      ..write(obj.correctAnswers)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.lastReviewed)
      ..writeByte(9)
      ..write(obj.tags)
      ..writeByte(10)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlashcardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FlashcardSetAdapter extends TypeAdapter<FlashcardSet> {
  @override
  final int typeId = 1;

  @override
  FlashcardSet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlashcardSet(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      flashcardIds: (fields[3] as List).cast<String>(),
      createdAt: fields[4] as DateTime,
      color: fields[5] as String,
      icon: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FlashcardSet obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.flashcardIds)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlashcardSetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashcardImpl _$$FlashcardImplFromJson(Map<String, dynamic> json) =>
    _$FlashcardImpl(
      id: json['id'] as String,
      front: json['front'] as String,
      back: json['back'] as String,
      category: json['category'] as String,
      difficulty: (json['difficulty'] as num?)?.toInt() ?? 0,
      timesReviewed: (json['timesReviewed'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastReviewed: DateTime.parse(json['lastReviewed'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$FlashcardImplToJson(_$FlashcardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'front': instance.front,
      'back': instance.back,
      'category': instance.category,
      'difficulty': instance.difficulty,
      'timesReviewed': instance.timesReviewed,
      'correctAnswers': instance.correctAnswers,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastReviewed': instance.lastReviewed.toIso8601String(),
      'tags': instance.tags,
      'isFavorite': instance.isFavorite,
    };

_$FlashcardSetImpl _$$FlashcardSetImplFromJson(Map<String, dynamic> json) =>
    _$FlashcardSetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      flashcardIds: (json['flashcardIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      color: json['color'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$$FlashcardSetImplToJson(_$FlashcardSetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'flashcardIds': instance.flashcardIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'color': instance.color,
      'icon': instance.icon,
    };
