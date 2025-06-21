import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/flashcard.dart';
import 'dart:math';

final flashcardBoxProvider = Provider<Box<Flashcard>>((ref) {
  return Hive.box<Flashcard>('flashcards');
});

final flashcardSetBoxProvider = Provider<Box<FlashcardSet>>((ref) {
  return Hive.box<FlashcardSet>('flashcard_sets');
});

final flashcardsProvider =
    StateNotifierProvider<FlashcardNotifier, List<Flashcard>>((ref) {
      final box = ref.watch(flashcardBoxProvider);
      return FlashcardNotifier(box);
    });

final flashcardSetsProvider =
    StateNotifierProvider<FlashcardSetNotifier, List<FlashcardSet>>((ref) {
      final box = ref.watch(flashcardSetBoxProvider);
      return FlashcardSetNotifier(box);
    });

class FlashcardNotifier extends StateNotifier<List<Flashcard>> {
  final Box<Flashcard> _box;

  FlashcardNotifier(this._box) : super(_box.values.toList());

  // Updated to handle object creation internally
  void addFlashcard({
    required String front,
    required String back,
    required String category,
  }) {
    final id = _generateId();
    final now = DateTime.now();
    final newFlashcard = Flashcard(
      id: id,
      front: front,
      back: back,
      category: category.isEmpty ? 'General' : category,
      createdAt: now,
      lastReviewed: now,
    );
    _box.put(id, newFlashcard);
    state = _box.values.toList();
  }

  void updateFlashcard(Flashcard flashcard) {
    _box.put(flashcard.id, flashcard);
    state = _box.values.toList();
  }

  void deleteFlashcard(String id) {
    _box.delete(id);
    state = _box.values.toList();
  }

  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(1000).toString();
  }
}

class FlashcardSetNotifier extends StateNotifier<List<FlashcardSet>> {
  final Box<FlashcardSet> _box;

  FlashcardSetNotifier(this._box) : super(_box.values.toList());

  void addFlashcardSet(FlashcardSet set) {
    _box.put(set.id, set);
    state = _box.values.toList();
  }

  void updateFlashcardSet(FlashcardSet set) {
    _box.put(set.id, set);
    state = _box.values.toList();
  }

  void deleteFlashcardSet(String id) {
    _box.delete(id);
    state = _box.values.toList();
  }

  String generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(1000).toString();
  }
}
