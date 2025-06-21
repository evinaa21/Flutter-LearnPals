import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/flashcard_provider.dart';

class CreateFlashcardSheet extends ConsumerStatefulWidget {
  const CreateFlashcardSheet({super.key});

  @override
  ConsumerState<CreateFlashcardSheet> createState() =>
      _CreateFlashcardSheetState();
}

class _CreateFlashcardSheetState extends ConsumerState<CreateFlashcardSheet> {
  final _formKey = GlobalKey<FormState>();
  final _frontController = TextEditingController();
  final _backController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _frontController.dispose();
    _backController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(flashcardsProvider.notifier)
          .addFlashcard(
            front: _frontController.text,
            back: _backController.text,
            category: _categoryController.text,
          );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Flashcard created successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create New Flashcard",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1E1E),
              ),
            ),
            const SizedBox(height: 24),
            _buildTextFormField(
              controller: _frontController,
              labelText: "Front (Question)",
              validatorText: "Please enter the front content.",
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              controller: _backController,
              labelText: "Back (Answer)",
              validatorText: "Please enter the back content.",
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              controller: _categoryController,
              labelText: "Category (e.g., History)",
              isOptional: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B61FF),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "Add Card",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    String? validatorText,
    bool isOptional = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: const Color(0xFFF6F5FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (!isOptional && (value == null || value.isEmpty)) {
          return validatorText;
        }
        return null;
      },
    );
  }
}
